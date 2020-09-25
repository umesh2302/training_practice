# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 01:35:38 2020

@author: umesh
"""

def word_search(doc_list, keyword):
    """
    Takes a list of documents (each document is a string) and a keyword. 
    Returns list of the index values into the original list for all documents 
    containing the keyword.

    Example:
    doc_list = ["The Learn Python Challenge Casino.", "They bought a car", "Casinoville"]
    >>> word_search(doc_list, 'casino')
    >>> [0]
    """
    final_list = []
    for document in doc_list : 
        print (document)
        lst = document.split()
        print (lst)
        for word in lst : 
            #print (word.lower())
            #print (keyword.lower())
            if keyword.lower() == word.lower() :  
                print (doc_list.index(document))
                final_list.append(doc_list.index(document))
    print (final_list)
    return final_list

def multi_word_search(documents, keywords):
    keyword_to_indices = {}
    for keyword in keywords:
        keyword_to_indices[keyword] = word_search(documents, keyword)
    return keyword_to_indices

answer =multi_word_search(["it casino", "like love is", "casino"],['casino','car'])
print ("answer", answer)
