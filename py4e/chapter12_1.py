# -*- coding: utf-8 -*-
"""
Created on Sun Aug 30 23:57:30 2020

@author: umesh
"""


# To run this, download the BeautifulSoup zip file
# http://www.py4e.com/code3/bs4.zip
# and unzip it in the same directory as this file

from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url = input('Enter - ')
count = int (input ("Enter Count"))
pos = int (input ("Enter position"))
# since we need to open one link from other , we need looping 

#tags = soup('a')
for i in range (count): 
    #print (url)
    counter = 0 # resetting the counter to zero every time 
    html = urlopen(url, context=ctx).read()
    soup = BeautifulSoup(html, "html.parser")
    # Retrieve all of the anchor tags
    tags = soup('a')
    for tag in tags:
        counter = counter +1 
        if counter == pos :
            #print('URL:', tag.get('href', None))
            #print('Contents:', tag.contents[0])
            url = tag.get('href', None)
            name= tag.contents[0]
            break
      
print (name) # printing the last name 
    
