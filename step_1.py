fhand=open("train.csv")
zero_count=0
non_zero=0
pidset=set()
for line in fhand:
    line=line.strip()
    line=line.split(',')
    date=line[0]
    sid=int(line[1])
    pid=line[2]
    units=int(line[3])
    if sid==1:
        if units==0:
            zero_count=zero_count+1
        else:
            pidset.add(pid)
print(zero_count)
print(non_zero)
print(pidset)