import sys
s=set()

for a in sys.argv:
    s.add(a)
#print(s)
arr = [str(len(sys.argv)-1)+"\n"]
try:
    temp=""
    with open("inputer.txt", "r", encoding="utf-8") as file:
        t = 0
        for line in file:
         #   print(t,temp)
            if (len(line)==1):
                if((t>0) and (str(t) in s)):
                    arr.append(temp)
                temp=""
                t=t+1
            else:
              #  print(line,end="")
                temp=temp+line
    if(str(t) in s):
        arr.append(temp)
    for ele in arr:
        print(ele,end="")
                
except Exception as e:
    print("Error:", e)


