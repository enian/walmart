import csv
import pandas as pd
import numpy as np
import os, glob
import csv
for file in glob.glob("*.csv"):

    filename=file
    temp_range=list()
    fhand=open(filename)
    for line in fhand:
        line=line.strip()
        line=line.split(',')
        try:
            units=line[3]
            temp_range.append(int(units))
        except:
            continue
    temp_range.sort(reverse=True)
    # print(temp_range)
    largest=(temp_range[0])
    # print(largest,type(largest))
    high_no =int(( largest/3 )*2)
    medium_no =int((largest/3))
    # print(high_no,medium_no)
    fhand.seek(0)

    for line in fhand:
        line = line.strip()
        line = line.split(',')
        date=line[0]
        store_no=int(line[1])
        product_no=int(line[2])
        unit=int(line[3])
        volume_sale=None
        if unit >=high_no:
            volume_sale="high"
        elif unit>=medium_no:
            volume_sale="medium"
        else:
            volume_sale="low"
        # print(unit,volume_sale)
        record = date,store_no, product_no,unit,volume_sale
        # print(record)
        new_file_name = "new"+ file
        with open(new_file_name, "a", newline='') as scoreFile:
            scoreFileWriter = csv.writer(scoreFile)
            scoreFileWriter.writerow(record)
        scoreFile.close()
        # print(file)


