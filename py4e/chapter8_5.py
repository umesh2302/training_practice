# -*- coding: utf-8 -*-
"""
Created on Sat Aug 15 14:23:06 2020
takes out email id 
@author: umesh
"""
fname = input("Enter file name: ")
if len(fname) < 1 : fname = "mbox-short.txt"

fh = open(fname)
count = 0

for line in fh:
    if not line.startswith("From:") : continue
    count = count+1
    temp_list = line.split()
    print (temp_list[1])# it will blow up if there is only one word Form: so need to add check
    
print("There were", count, "lines in the file with From as the first word")   