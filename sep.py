#dev: niki404_tg
import os

def sep_cookies():
    f=input('[>] File Path: ')
    if not os.path.exists(f): 
        print(f"[!] Error: '{f}' not found!"); return

    a,b,c=[],[],[]
    for l in open(f,encoding='utf-8'):
        l=l.strip()
        if not l: continue
        i=l.split('|')[0]
        (a if i.startswith('1000') else b if i.startswith('615') else c).append(l)

    if a: open('/sdcard/1000_ids.txt','w',encoding='utf-8').write('\n'.join(a))
    if b: open('/sdcard/615_ids.txt','w',encoding='utf-8').write('\n'.join(b))
    if c: open('/sdcard/other_ids.txt','w',encoding='utf-8').write('\n'.join(c))

    print("Task completed!")

sep_cookies()
