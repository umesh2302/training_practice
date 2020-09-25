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

 
html = urlopen(url, context=ctx).read()
soup = BeautifulSoup(html, "html.parser")
    # Retrieve all of the anchor tags
tags = soup('a')
for li in soup.find_all('li', class_= lambda value: value and value.startswith('toc')):
    a = li.find('a')
    print(a['href'], a.get_text())
    
