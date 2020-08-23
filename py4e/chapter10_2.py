# -*- coding: utf-8 -*-
"""
Created on Fri Aug 21 00:49:26 2020
splits out time and then sorts based hours count
@author: umesh
"""

count = 0
sum_total = 0
fname = input("Enter file name: ")
fh = open(fname)
#main_time = [] we can do it without it and transfer time and count directily in list
dic_time = dict()
final_time =[]
for line in fh:
    if not line.startswith("From") : continue
    if line.startswith("From:"): continue
    
    #print (line)
    location = line.find(":")
    #print (location)
    new_time = (line[location-3::]).strip()
    #print (new_time.strip())
    time = new_time.split(":")
    dic_time[time[0]] =dic_time.get(time[0],0)+1
    #main_time.append(time[0])

#print (main_time)
#for t in main_time:
 #   dic_time[t] = dic_time.get(t,0) + 1

#print (dic_time)

for t, count in dic_time.items():
    time_tuple = (t,count)
    final_time.append(time_tuple)
    
final_time.sort()

for t, count in final_time[:]:
    print (t,count )
    
    
    
