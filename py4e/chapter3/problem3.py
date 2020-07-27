score = input ("Enter a score :")
try :
    s = float(score)
    if (s> 1 or s <0) :
        print ("you enter a wrong score")
    elif s >= 0.9:
        print (">= 0.9 A")
    elif s>= 0.8:
        print (">=0.8 B")
    elif s >= 0.7:
        print (">=0.7 C")
    elif s>= 0.6 :
        print (">= 0.6 D")
    else :
        print ("< 0.6 F")
except :
    print ("you need to enter a numeric value")
