# -*- coding: utf-8 -*-
"""
Created on Thu Aug 13 01:34:36 2020

@author: umesh
"""
#setting varius vairable 
total = 0
count = 0
sum_total = 0
max_number = None
min_number = None
while True :
    number = input("enter a number")
    if number == "done":
        break  
    try:
       n= float(number)
       total = total +n 
       
       count = count +1
       if max_number == None: 
           max_number = n
       elif n > max_number:
           max_number = n 
       if min_number == None : 
           min_number = n
       elif n< min_number :
           min_number = n
           
   
    except : 
       print("Invalid input")
#if count == 0:
#    print (total, count)
#else: 
#    print (total, count, total/count)
print ("Maximum is", max_number)
print ("Minimum is",min_number)


