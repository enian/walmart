import pandas as pd
import os, glob
import csv
for file in glob.glob("*.csv"):




    if len(file)>9:break
    print(file, len(file))
    a = pd.read_csv(file)
    b = pd.read_csv("store_1_station_1_.csv")
    # b = b.dropna(axis=1)
    merged = a.merge(b, on='date')
    file_name=str("joined_")+file
    merged.to_csv(file_name, index=False)
    print(file_name)
