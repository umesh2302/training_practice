# -*- coding: utf-8 -*-
"""
Created on Thu Aug 13 21:57:10 2020

@author: umesh
"""


text = "X-DSPAM-Confidence:    0.8475";
location = text.find(":")
#print (location)
next_text = text[location+1:40]
#print (next_text)
final_text = next_text.strip()
print(float(final_text))
