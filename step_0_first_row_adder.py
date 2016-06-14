import pandas as pd
import os, glob
import csv


for file in glob.glob("*.csv"):
    with open(file, "r+") as f:
        old = f.read()  # read everything in the file
        f.seek(0)  # rewind
        f.write("station_nbr,date,tmax,tmin,tavg,depart,dewpoint,wetbulb,heat,cool,sunrise,sunset,codesum,snowfall,preciptotal,stnpressure,sealevel,resultspeed,resultdir,avgspeed\n" + old)  # write the new line before