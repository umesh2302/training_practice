# -*- coding: utf-8 -*-
"""
Created on Sat Aug 15 13:47:19 2020
read all words of a file , removes duplicates and sort them out
@author: umesh
"""


fname = input("Enter file name: ")
fh = open(fname)
lst = list()
for line in fh:
    new_line = (line.rstrip())
    temp_list = new_line.split()
    #print (temp_list)
    for i in temp_list:
        if i in lst :
            continue
        lst.append(i)
        
lst.sort()
print (lst)