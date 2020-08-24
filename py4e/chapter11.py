# -*- coding: utf-8 -*-
"""
Created on Tue Aug 25 00:24:59 2020
finds all numbers in a files and add them up 
@author: umesh
"""

fname = input("Enter file name: ")
if len(fname) < 1 : fname = "actual_data.txt"

fh = open(fname)
total = 0
lst =[]

import re 

for line in fh:
    line = line.rstrip()
    x = re.findall(r'[0-9]+', line)
    if len(x) > 0:
        lst.extend(x)

for number in lst : 
    total = total+int(number) 
    
print (total)