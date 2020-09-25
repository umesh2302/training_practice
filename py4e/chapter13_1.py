# -*- coding: utf-8 -*-
"""
Created on Sun Sep  6 03:26:43 2020

@author: umesh
"""



import urllib.request, urllib.parse, urllib.error
import ssl
import json


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
info = json.loads(data)
print('User count:', len(info))
total=0
lst=  info['comments']
for item in lst : 
    total = total +(item["count"])
print (total)