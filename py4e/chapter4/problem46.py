hours = input ("enter hours")
rate = input ("enter rate")
h1= float(hours)
r1 = float(rate)
def computepay (h,r):
    # returns result of hours and rate
    if h <= 40:
        pay = h*r
    else :
        pay = 40*r+ (h-40)*r*1.5
    return (pay)

print (computepay(h1,r1))