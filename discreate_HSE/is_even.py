# -*- coding: utf-8 -*-
"""
Created on Sat Sep 12 23:46:48 2020

@author: umesh
"""


def is_even(p):

  n= len(p)
  count= 0
  # count == number of transposition used so far
  s= 0 # s minimal elements are at their places 0..s-1
  while s < n-1:
  # fill p[s] correctly by finding min p[s..n-1]:
    #print ('start s', s)
    i= s
    t= s+1
# t<=n, p[i] is minimal among p[s]..p[t-1]
    while t < n:
      if p [t] < p [i]:
        i = t
        
      t += 1
      #print (i)
# t == n, p [i] is minimal among p [s] .. p [n-1]
    print ('number exchanging', i, s , p[i],p[s],p)
    if p[s] > p[i] : 
        p [s], p [i] = p [i], p [s]; count += 1
    print ('outer loop',p, count)
    s += 1
    #print('last s', s)
  return count% 2 == 0


print (is_even ([0,3,2,4,5,6,7,1,9,8] ))