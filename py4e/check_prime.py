# -*- coding: utf-8 -*-
"""
Created on Sun Sep  6 23:21:07 2020

@author: umesh
"""

def check_prime (number): 
    if number <= 1 : 
        return ("out of range")
    else : 
        #print ("number", number )
        for check in range (number):
            if check < 1 : continue 
            if (check+1) > number/2 : 
                return True 
            else: 
                #print ("check", check , number % (check+1))
                if number % (check+1) == 0 : 
                    return False
        
n= input ("enter a number up to ")
n = int (n)


for i in range (n): 
    #print (i, i**2+i+41 )
    if i > 1 and check_prime(i**2+i+41)== False :         
        print (i, (i**2+i+41))
    


    