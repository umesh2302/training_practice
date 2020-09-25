# -*- coding: utf-8 -*-
"""
Created on Tue Sep  1 21:58:26 2020

@author: umesh
"""


import urllib.request, urllib.parse, urllib.error
import xml.etree.ElementTree as ET
import ssl


# If you have a Google Places API key, enter it here
# api_key = 'AIzaSy___IDByT70'
# https://developers.google.com/maps/documentation/geocoding/intro

# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE
total = 0

address = input('Enter url: ')
url = address
print('Retrieving', url)
uh = urllib.request.urlopen(url, context=ctx)

data = uh.read()
print('Retrieved', len(data), 'characters')
    #print(data.decode())
tree = ET.fromstring(data)

results = tree.findall('comments/comment')
for result in results :
    total = total +int (result.find('count').text)
    
print (total)