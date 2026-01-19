#!/usr/bin/env python3
import openpyxl, re

def extract_nums(file_path):
    try:
        wb = openpyxl.load_workbook(file_path, data_only=True)
        data = (str(c) for r in wb.active.iter_rows(values_only=True) for c in r if c)
        nums = {re.sub(r'\D', '', s) for s in data}
        return [n for n in nums if 7 <= len(n) <= 15]
    except Exception: return []

def banner():
    line = "\033[1;97m" + "━"*48
    print(f"{line}\n\033[1;92m[+] Input  : /sdcard/file.xlsx\n\033[1;93m[+] Output : /sdcard/file.txt\n{line}")

if __name__ == "__main__":
    banner()
    inp = input("[>] Enter xlsx Path: ")
    out = input("[>] Enter txt Path: ")
    
    numbers = extract_nums(inp)
    if numbers:
        with open(out, "w") as f: f.write("\n".join(numbers) + "\n")
        print("\033[1;97m" + "━"*48)
        print(f"\033[1;92m[√] Successfully Converted {len(numbers)} Numbers!")
    else:
        print("\033[1;31m[!] No numbers found or File Error!")
