# BB 345 Midterm Fall 2020
"""
L = ['a', 'g', 'b', 'z', 'h']
print(sorted(L, reverse = True))
"""

x = 3
L = list()
# append(x)
while (x < 19):
    x = x + 2
    L.append(x)
print(L)


# Question 13
# import re
DNA = 'AGCTGCATCA'
print(DNA[2:5])
# segment = re.search('CGT',DNA)
# print (segment.start(), segment.end(), segment.group())


# Question 16
shopping_cart = ('apple','bread','candy')
shopping_cart = list(shopping_cart)
shopping_cart[2] = 'celery'
print(tuple(shopping_cart))


# Question 11
L = ['a', 'g', 'b', 'z', 'h']
L.sort(reverse = True)
SortedList = L
print(SortedList)



# Question 14
DNA = 'TTGCTAGCTAGCTAGCTAGTGCATCGATC'
print(DNA)
First_string = DNA[3:8]
print(First_string)
Second_string = DNA[11:6:-1]
print(Second_string)
New_string = First_string + Second_string
print(New_string)



D = {'a':'1', 'b':'2', 'c':'3'}
for x in D:
    print(x)

# Question 17
DNA = 'TGCTACTATCGATCGATCGATCGTA'
complement = {'T':'U','A':'A','G':'G','C':'C'}
RNA = ''
for b in DNA:
    RNA = RNA + complement[b]

print("DNA is ", DNA)
print("RNA is ", RNA)

