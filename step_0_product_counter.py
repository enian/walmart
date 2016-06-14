ccc=dict()
fhand=open("products_list.csv")
count=0
for line in fhand:
    line=line.strip()
    line=line.split(',')
    for word in line:
        if word not in ccc:
            ccc[word]=1
        else:
            ccc[word] = ccc[word] +1
for x,y in ccc.items():
    print(x,y)
