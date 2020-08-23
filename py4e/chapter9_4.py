# -*- coding: utf-8 -*-
"""
Created on Tue Aug 18 23:29:55 2020
takes out email id and assigns dictionary 
@author: umesh
"""

fname = input("Enter file name: ")
if len(fname) < 1 : fname = "mbox-short.txt"

fh = open(fname)
count = 0
email = dict()
final_list =[]

for line in fh:
    if not line.startswith("From:") : continue
    #
    temp_list = line.split()
    #print (temp_list[1])# it will blow up if there is only one word Form: so need to add check
    final_list.append(temp_list[1]) # making a list to use it later
    

print (final_list)
for name in final_list:
    email[name] = email.get(name,0) + 1
    
print(email)
most_email =0 
most_count =0

for email_id in email :
    if most_email == 0:
        most_email = email_id
        most_count = email[email_id]
    else :
        if email[email_id] > most_count:
            most_email = email_id
            most_count = email[email_id]
    
print (most_email, most_count)


#print("There were", count, "lines in the file with From as the first word")   