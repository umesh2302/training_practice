# -*- coding: utf-8 -*-
"""
Created on Mon Aug 24 23:37:35 2020
uses recursive function to give changes in coin 5 and 7 for any given amount 
more than 23 , ( 23 is largest amount not possible to pay by using 5 and 7 coins)

@author: umesh


"""
amt = input ("input any number larger than 23")
amt= int(amt)

def change(amount):
 coin = []
 if amount == 24:
    return [5, 5, 7, 7]
 if amount == 25: 
    return [5,5,5,5,5]
 if amount == 26 :
      return [7,7,7,5]
 if amount == 27 :
      return [5,5,5,5,7]
 if amount == 28 :
    return [7,7,7,7]
 else :
   coin.extend([5])
   #print (coin)
   amount = amount-5
   coin.extend(change(amount))
   return coin
print (change(amt))   
