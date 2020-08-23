# -*- coding: utf-8 -*-
"""
Created on Sat Aug 15 01:24:00 2020

@author: umesh
"""
count = 0
sum_total = 0
fname = input("Enter file name: ")
fh = open(fname)
for line in fh:
    if not line.startswith("X-DSPAM-Confidence:") : continue
    count = count+1
    location = line.find(":")
    next_text = line[location+1:40]
    final_number = float(next_text.strip())
    sum_total = sum_total + final_number
print ("Average spam confidence: ",sum_total/count)
