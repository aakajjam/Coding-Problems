# This is the comment out symbol

a = 100
b = 200
c = 0
d = 20

def compare(arg1, arg2):
    if(arg1 < arg2):
        print(" arg1 is less than arg2 " + str(arg1))
        arg1 = 0
    elif(arg2 < arg1):
        print (" arg1 is greater than arg2 " + str(arg1))
    else:
        print(" arg2 is equal to arg1 " + str(arg2))
    return 0

compare(a,b)
print(a)

compare(c,d)
print(c)

def looping(arg3):
    while(arg3 < 1000):
        arg3 = arg3 + 100
        print(arg3)

looping(a)
print(a)

def forlooping(arg4):
    for arg4 in range (0,20,2):
        print(arg4)

forlooping(c)