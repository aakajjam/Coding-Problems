"""
n = 6
L = list()
while (n <= 33):
    n = n + 3
    L.append(n)

print(L)
"""

# Problem 5
sequence = "TGACGTCA"
complement = {"A":"T","C":"G","T":"A","G":"C"}
Complementary = ""
for b in sequence:
    Complementary = Complementary + complement[b]

print("The complementary sequence is", Complementary)




"""
complementary = ""
for b in complement:
    complementary = complementary + b
    print (b)

print (complementary)
"""

L = [2,6,3,7,2,356,64,25,67,12,764,43,654,2,6,45,3]
count = 0
num = 0
number = 0
for x in L:
    if(x>50):
        count = count + 1
    elif(x == 2):
        num = num + 1
    if(x>=100):
        number = number + 1


print("The count greater than fifty is", count)
print("The count equaling two is", num)
print("The count with three digits are", number)

