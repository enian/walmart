# this program prints zero unit files
# Non zero units
# and total lines
x=0
count=0
nonzero=0
store1=dict()
x=0
fhand=open("train.csv")
for line in fhand:
    line=line.strip()
    line=line.split(',')
    # print(line)
    date=line[0]
    store_nbr = (line[1])
    item_nbr = line[2]
    units = line[3]
    x=x+1
    try:
        units=int(units)
        if units==0:
            count=count+1
            # print(units)
        else:
            nonzero=nonzero+1
    except:
        continue
print("zero unit Count",count)
print("Non zero",nonzero)
print("Total lines",x)