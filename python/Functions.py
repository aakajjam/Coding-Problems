# Functions in Python
# C to F function to convert Celcius to Farenhieght and returns farenhieght

def CtoF(C):
    F = (1.8*C) + 32
    return F

#Celcius = 0
# Celcius = int (input ("Enter a temperature in C: "))

#Farenhieght = CtoF(Celcius)

print ("Celcius" + "\t" + "Farenhieght")

x = range(0,201,10)
for y in x:
    #print(y)
    #print('\t')
    a = (CtoF(y))
    print (str (y) + "\t" + "\t" + str (a))
