# Takes one store file and splits them into indivduval product files
import csv


part1="store_number_"
part2="_NEW OUTPUT.csv"
product_set=set()


for file in range(1,46):
    filename= part1 + str(file) + part2
    fhand=open(filename)
    for line in fhand:
        line=line.strip()
        line=line.split(',')
        pid=int(line[2])
        product_set.add(pid)

    fhand.seek(0)

    product_list=[]
    for x in product_set:
        product_list.append(x)

    product_list.sort()
    print(product_set)

    def item(xyz,filename ):
        fhand.seek(0)
        for line2 in fhand:
            line2 = line2.strip()
            line2 = line2.split(',')
            sno2=line2[0]
            pid2 = int(line2[2])
            dates=line2[1]
            unitss=line2[3]
            if xyz == pid2:
                fname=str(sno2)+"_"+str(xyz)+".csv"
                print(fname,line2)
                with open(fname, "a", newline='') as scoreFile:
                    scoreFileWriter = csv.writer(scoreFile)
                    scoreFileWriter.writerow([dates,sno2,pid2,unitss])
                scoreFile.close()

    for i in product_list:
        item(i,filename)


