"""
first = "Akshay"
last = "Kajjam"
formatted = "My name is {} {}".format(first,last)
print(formatted)
"""
"""
# Mileage Converter (This uses f strings)
print("How many miles did your bike today, enter the number of km")
km = float(input())
miles = km/1.6
print(f"You rode {round(miles,2)} miles today ")
# The "round" statement does rounding and the "2" after miles rounds to 2 decimal places
"""
"""
# Lucky number 7
from random import randint
choice = randint(1,10)

if choice == 7:
    print("lucky")
else:
    print("unlucky")
"""
"""
# Odd or even
from random import randint
num = randint(1, 1000)
print(num)

if num % 2 != 0:
    print("odd")
else:
    print("even")
"""
"""
# Food Classifying Excercise
from random import choice
food = choice(['apple','grape', 'bacon', 'steak', 'worm', 'dirt'])
print(food)

if food == "apple" or food == "grape":
    print("fruit")
elif food == "bacon" or food == "steak":
    print("meat")
else:
    print("yuck")
"""
"""
# Boolean logic quiz
x = 0
y = -1
((x or y) and (x - 1 == y and y + 1 == x))
# (True) and (True and True)
# False and True
print(x or y)
"""
"""
# Bouncer
# If you are 18-21 you can enter but need a wristband
# If you are 21+ you can enter and drink
# If you are below 18 you can't enter

age = input("Please enter your age ")
if age != "":
    age = int(age)
    if age >= 21:
        print("You can enter and drink")
    elif age >= 18:
        print("You can enter but need a wrist band")
    elif age < 18:
        print("You can't enter, go to Chucky Cheese instead")
else:
    print("Please enter your age")
"""
"""
# Checking positive or negative
# NO TOUCHING==NO TOUCHING==NO TOUCHING==NO TOUCHING #| \
from random import randint                           #|  \
x = randint(-100, 100)                               #|   \
while x == 0:  # make sure x isn't zero              #|    \
    x = randint(-100, 100)                           #|     NO TOUCHING!!!!!! (please)
y = randint(-100, 100)                               #|    /
while y == 0:  # make sure y isn't zero              #|   /
    y = randint(-100, 100)                           #|  /
# NO TOUCHING==NO TOUCHING==NO TOUCHING==NO TOUCHING #| /



# Don't change the print statements so the tests can pass!
# YOUR CODE GOES HERE vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
if x > 0 and y > 0:
    print("both positive")
elif x < 0 and y < 0:
    print("both negative")
elif x > 0 and y < 0:
    print("x is positive and y is negative")
else:
    print("y is positive and x is negative")
print(x,y)
# YOUR CODE GOES HERE ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"""
"""
# Calling in sick
# NO TOUCHING ======================================

from random import choice, randint

# randomly assigns values to these four variables
actually_sick = choice([True, False])
kinda_sick = choice([True, False])
hate_your_job = choice([True, False])
sick_days = randint(0, 10)

# NO TOUCHING ======================================

calling_in_sick = None  # set this to True or False with Boolean Logic and Conditionals!

# YOUR CODE GOES HERE vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
if actually_sick and sick_days > 0:
    calling_in_sick = True
elif kinda_sick and hate_your_job and sick_days > 0:
    calling_in_sick = False
else:
    calling_in_sick = False

# YOUR CODE GOES HERE ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"""
"""
# Rock Paper Scissors
import random
# from random import randint
rand_num = random.randint(0,2)
if rand_num == 0:
    computer = "rock"
elif rand_num == 1:
    computer = "paper"
else:
    computer = "scissors"


Player1 = input("Player 1 enter your choice ").lower()
# print("NO LOOKING\n" * 5)

if Player1 == computer:
    print("It's a tie!")
elif Player1 == "rock":
    if computer == "scissors":
        print("player1 wins!")
    elif computer == "paper":
        print("computer wins!")
elif Player1 == "paper":
    if computer == "rock":
        print("player1 wins!")
    elif computer == "scissors":
        print("computer wins!")
elif Player1 == "scissors":
    if computer == "paper":
        print("player1 wins!")
    elif computer == "rock":
        print("computer wins!")
elif computer == "scissors":
    if Player1 == "rock":
        print("Player1 wins")
    elif Player1 == "paper":
        print("computer wins")
elif (Player1 != "rock" and "paper" and "scissors") or (computer != "rock" and "paper" and "scissors"):
    print("Something went wrong")
else:
    print("Something went wrong")
print(f"The computer played {computer}")
"""
"""
# For loop and range excercise
# Add up all odd numbers between 10 and 20
# Store the result in x:
x = 0
for y in range(10,21):
    if y % 2 == 0:
        pass
    else:
        x = x + y
print(x)
"""
"""
# Repeater Excercise
times = input("How many times do I have to tell you ")
command = int(times)
for t in range(command):
    print(f" for the {t+1} clean up your room")
"""
"""
# Unlucky Excercise
for x in range(1,21):
    if x == 4 or x == 13:
        print(f"{x} is UNLUCKY")
    elif x % 2 == 0:
        print(f"{x} is even")
    else:
        print(f"{x} is odd")
"""
"""
# Basic While Loop
message = input("What is the secret password ")
while message != "bananas":
    print("WRONG")
    message = input("What is the secret password ")
print("CORRECT")
"""
"""
num = 1
while num < 10:
    num = num + 1
    if num % 2 != 0:
        print(num)
    else:
        pass
"""
"""
# Emoji Art
# You can do string multiplication
faces = "\U0001f600"
for i in range(1,11):
    print(i * faces)
# Now with a while loop
times = 1
while times < 11:
    print(faces*times)
    times = times + 1
# Now with a nested loop
for j in range(3):
    for i in range(1,11):
        print(i*faces)
"""
"""
# Emoji Art - Ugly Solution
for num in range(1,11):
    count = 1
    smile = ""
    while count <= num:
        smile = smile + "\U0001f600"
        count = count + 1
    print(smile)
"""
"""
# Stop Copying Me Excersise
# You can have an else statement after a while loop
Talking = input()
while Talking != "Stop Copying Me":
    print(Talking)
    Talking = input()
else:
    print("Fine")
"""
"""
# Break Keyword- It breaks out immediately from the loop
while True:
    command = input("Type exit to exit: ")
    if command == "exit":
        break
for x in range(0,100):
    print(x)
    if x == 10:
        break
times = int(input("How many times do I have to tell you? "))
for x in range(times):
    print("Clean your room")
    if times >= 5:
        print("You never listen")
        break
"""
"""
# While Loop Excersise - Emailed about this to instructor Colt
from random import randint  # use randint(a, b) to generate a random number between a and b
i = 0
number = 0 # store random number in here, each time through
while number != 5:
   number = randint(0,10)
   i = i + 1  # i should be incremented by one each iteration
   print(number)
"""
"""
# While Loop problem
sum = 0
i = 0
while i < 10:
    i = i + 1
    number = int(input())
    sum = sum + number
    Average = sum/10
print(Average)
"""
"""
# While Loop Guessing Game
import random
random_number = random.randint(0,100)

Guess = None # This Guess = None is not needed anymore since we say while True

while True: # You can also say while True and it will truthfully run forever
    Guess = int(input("Enter a number "))
    if Guess > random_number:
        print(Guess, "Too high")
    elif Guess < random_number:
        print(Guess, "Too low")
    elif Guess == random_number:
        print("WINNER, want to play again type y/n")
        enter = str(input())
        if enter == "y":
            random_number = random.randint(1,100)
            Guess = None
        else:
            print("Thank you for playing. NOW GO AWAY!!!")
            break # The break will exit out of the loop immediately
"""
"""
# Lists Excercises
nums = list(range(1,100))
print(nums)
print(len(nums))
# Both of these will work 
#nums = range(1,100)
#print(list(nums))
"""
"""
# Accessing List Data
people = ["Hanna","Louisa","Claudia", "Angela","Geoffrey", "aparna"]
people[0] = "Hannah"
people[4] = "Jeffrey"
people[5] = "Aparna"
"""
"""
# Iterating over lists
sounds = ["super", "cali", "fragil", "istic", "expi", "ali", "docious"]
result = ""
for i in sounds:
    result = result + i.upper()
print(result)

index = 0
while index < len(sounds):
    print(f"{index}:{sounds[index]}")
    index = index + 1
"""
"""
# List Basics Exercise
instructors = ["Colt"]
instructors.extend(["Blue","Lisa"])
print(instructors)

# Create a list called instructors
instructors = []
# Add the following strings to the instructors list
    # "Colt"
    # "Blue"
    # "Lisa"
instructors.append("Colt")
instructors.extend(["Blue","Lisa"])
# Remove the last value in the list
instructors.remove("Lisa")

# Remove the first value in the list
instructors.remove("Colt")
# Add the string "Done" to the beginning of the list
instructors.insert(0,"Done")
# Run the tests to make sure you've done this correctly!

# List Methods
    # index() - This method gives the index/position of a specified element in a list
# Straightforward definition # append() - This method adds an element to the end of a list
# Straightforward definition # extend() - This method adds multiple elements of an iterable (list, tuple, string,etc) to the end of a list # must also have [] inside the ()
    # insert() - This method inserts an element in a list at a specified index
    # remove() - This method removes the first matching element (which is passed as an argument) fromt the list
# Straightforward definition # count() - This method tells you the number of times a specific element appears in a list
    # pop() - This method removes the item at the given index from the list and returns the removed item
# Straightforward definition # reverse() - THis method reverses the order of the elements in a list
# Straightforward definition # sort() - This method sorts the elements of a given list in a specific ascending or descending order
# Straightforward definition # copy() - This method returns a copy of the list
# Straightforward definition  # clear() - This method removes all items from the list
"""
"""
write = "I will not talk in class"
i = 0
while i < 10:
    i = i + 1
    print(write, i)

for x in range(1,11):
    print(write, x,)
"""
"""
# List
colors = [1,"blue","3",4,5]
print(colors[1][::-1])
"""
"""
# Swapping
names = ["Flo","Rida"]
print(names)
names[0],names[1] = names[1],names[0]
print(names)
"""
"""
# Functions
def laugh():
    print("HA!" * 20)
    print("lol")

# Functions with single output
def laugh_more(strength):
    print("HA" * strength)

laugh_more(1)
laugh_more(2)
laugh_more(3)


# Funtions with multiple outputs
def divide(first_num, second_num):
    print(first_num/second_num)

divide(12,3)

# Using the return keyword
def divide_again(first, second):
    if second == 0:
        return("DON'T BOTHER TRYING")
    return(first/second)

divide_again(2,1)
result = divide_again(2,0)
print(result)

# Evens and odds functions problem
def is_even(number):
    if number % 2 == 0:
        return(True)
    return(False) # The else is not needed
# Can also write return number % 2 == 0 only instead of the conditionals and it will return True or False

print(is_even(245654))
print(is_even(8765345))

# Remove spaces and make lowercase with fucntions
def slugify(word):
    return word.lower().strip().replace(" ","-")

print(slugify("I love PIE"))

# Vowel Count using functions

def vowel_count(phrase):
    count = 0
    for letter in phrase:
        if letter in "aeiou":
            count = count + 1
    return count

print(vowel_count("Rajesh"))

# Default Parameters - ORDER MATTERS any default parameters must come after non defined parameters
def keep_laughing(intensity = 10):
    print("HA" * intensity)

keep_laughing()
keep_laughing(2)

def slugify_continued(phrase, sep = "-"):
    return phrase.lower().strip().replace(" ", sep)

# Order for default parameters
def greet(person, msg = "Hi"): # Order matters here, variable comes first, then the default
    # Order matters since python does not know where to overwrite if default parameter comes first
    print(f"{msg}, {person}!")

greet("Tony")
"""
"""
# Scope - This is tied to functions
# Scope means defining a boundary a variable can be used
# Four main types of scoping - Lexical, Enclosing, Global, Built-in (LEGB)

# Global Scope - Variables defined outside the function are global since ALL functions have access to them
movie = "Amadeus" # Defined outside the function
def review():
    print(movie)
    def inner():
        print(movie)

animal = "Lemur"  # All functions have access to animal since defined outside of function
print("OUTSIDE OF FUNCTION:", animal)

def func():
    print("INSIDE FUNC", animal)

func()
# If you have a nested function, you must execute each function nested if you want that function to run

# Local Scope
# These are variables defined inside a function that are not available outside the function
def cube(num):
    print (answer = num ** 3 ) # The two variables are bound in the function and can't be used outside
"""
"""
# Enclosing Scope
def outer():
    animal = "Secretary Bird"
    def inner():
        print("INSIDE INNER FUNC", animal)
        def third():
            print("THIRD INSIDE FUNC", animal)
        third()
    inner()
outer()
"""
"""
# Scope Precedence Rules
animal = "Nudibranch"

def outer():
    animal = "Echidna"
    print(animal)
outer()
# Remember the order LEGB Lexical, Enclosing, Global, Built-in

# Global Keyword
def outer():
    global animal # This tells Python to make the variable globally scoped instead of locally
    animal = "Spider Crab"
outer()
print(animal)

score = 100
def double_score():
    #score = score * 2 # Error since we're ASSIGNING score (which is updating the original varialbe called score) to score * 2
    print(score * 2) # This will NOT cause an error because the original variable is globally scoped
    # To combat the error set the variable score to global to tell python to reference outside the local scope
double_score()
print("The first 200 is from the double_score function")

def correct_way_score():
    global score
    score = score * 2
    print(score)
correct_way_score()
print("The second 200 is from the correct_way_score function")
"""
"""
# Global Keyword Problem
color = "purple"

def my_func():
    global color # This references the originally defined variable (color = "purple"). Which means color is purple inside my_func()
    color = "green"# This line UPDATES the original varible color into a new variable also called color

print(color) # The color starts off as purple and is printed as color (first line)
my_func() # Then my_func() runs and UPDATES the color to green
print(color) # The second color prints green BECAUSE my_func() was UPDATED to green
"""
"""
# Upddating List Elements
nums = [7,3,9]
nums [1] = 8 # The second element in the list nums was updated from 3 to 8
print(nums)
"""
"""
# List Slices
# List[start:stop:step]
waitlist = ["Jasmine","Juan", "Aria", "Uma", "Amir", "Rosa", "Colt", "Charlie", "Drew", "Emi"]
print(waitlist[5:10])
print(waitlist[0:11:2])
print(waitlist)
# Slices can also be used for UPDATING lists which you CAN'T do for strings
nums = [4,5,6,7]
nums[1:3] = ['a','b', 'c', 'd'] # This will insert the four strings into the list even though we chose the range as 1:3
print(nums)
nums[1:5] = [5] # This will update the list as well and shorten it even though the range is 1:5
print(nums)
"""
"""
# List Deletion Methods: pop(), popitems(), remove(), clear()
# Clear - This empties out a list, which leaves an empty list
langs = ["Python", "C", "Javascript", "C"]
langs.clear()
print(langs)

# Remove - This method will remove the FIRST value in the list even if there are duplicates - Example below
langs = ["Python", "C", "Javascript", "C"]
langs.remove("C")
print(langs) # The first "C" value is removed and NOT the second even though there were two "C" in the original list

# Pop - This will return values
langs = ["Python", "C", "Javascript", "C"]
langs.pop() # If nothing is inside of pop() it will remove the very last element in the list AND RETURNS the last value
new_list = langs.pop(0) # This will accept a specific index/element position and will remove the item at that index AND RETURN it
print("langs after pop is used", langs)
print("This the new list", new_list)

# Delete
# The del statement can be used to delete an item from a specific index in a list - IT'S NOT A LIST METHOD
langs = ["Python", "C", "Javascript", "C"]
del langs[2] # The del statement DOES NOT return anything
print(langs)

nums = [2,6,8,2,4]
del nums[2::]
print(nums)

nums = [1,2,3,4,5,6,7,8,9]
del nums[::2]
print(nums)
"""
"""
# Iterating over Lists
langs = ["Python", "C", "Javascript", "C"]
for lang in langs:
    print(lang)
# Now with a while loop
print("This is for a while loop")
idx = 0
while idx < len(langs):
    print(langs[idx])
    idx = idx + 1

#Lists + Loop Patterns
lando_2021_results = [4,3,5,8,3,5,5,5,3,4,14,10,2,7,7,8,10,10,9,10,7]

total = 0
for num in lando_2021_results:
    total = total + num
print(total)

average = total/len(lando_2021_results)
print(average)

minimum = lando_2021_results[0]
for num in lando_2021_results:
    if num < minimum:
        minimum = num
print(minimum)
"""
"""
# Nested Lists
nums = [1,2,3,4,[5,6]]
print(nums[4]) # Prints the all the values in the foruth element so it would print [5,6]
print(nums[4][1]) # The first prints all values in fourth element, the second prints the index value within fourth element
# We get 6 printed out for print(nums[4][1]) since fourth index is [5,6] and the first index afterwards is indexing within [5,6]

couples =[["Beyonce", "Jay-Z"], ["Johnny", "June"], ["John", "Yoko"], ["Will", "Jada"]]
print(couples[1][0])
print(couples[1][0][5]) # The last one, allows us to access the individual letters in the string

# Iterating over nested lests
for spouse in couples: # The first for loop iterates over the elements within the first outer list (the very first and very last square bracket)
    for person in spouse: # The second for loop iterates over the elements within the second list
        print("Sending invite to", person)
"""
"""
# List Operators
# Addition
print([1,2,3] + [4,5,6]) # Adding will CONCATENATE the two lists into a NEW list, ORDER MATTERS
# Multiplication
print([7,8,9] * 2) # This will make a NEW list and will multiply by 2, only works with whole numbers
# Can use in operator
[0,9,8]
print(0 in [0,9,8])
"""
"""
# List Methods
# count() - This method prints the number of times a value occurs in list, if a value ISN'T in list then we get zero
lando_2021_results = [4,3,5,8,3,5,5,5,3,4,14,10,2,7,7,8,10,10,9,10,7]
print(lando_2021_results.count("asdfk"))
print(lando_2021_results.count(5))
# reverse() - This will reverse a list in place, it does this in the SAME list, it DOESN'T create a new list
nums = [1,2,3,4,5]
nums.reverse()
print(nums)
# sort() - This will sort out the items in ASCENDING oder
numbers = [4,5,12,8,-23,342,6,5,0]
numbers.sort(reverse = True) # Optional parameter, sort() will accept the reverse = True parameter for DESCENDING
print(numbers)
colors = ["red", "orange", "purple", "green"]
colors.sort()
print(colors)
"""
"""
# Lists are Mutable
list1 = [12,9,3,7]
# id() - this returns the identity of an object. Pass in a value, it returns the unique identity in memory
# Think of this unique identity as a social security number
print(id(9))
list2 = list1 # They are pointing to the SAME list, it is NOT a separate list, changes to list2 also change list1
# Comparing Lists == vs is
# The == compares the contents inside the list, do they have the same value
# The is compares the identity os the lists, are they the same CONTAINER in memory
"""
"""
# Join and Split - These are string methods NOT list methods - But they have to do with lists

# The split() is a string method that will cut a string on a given character. It returns a list that holds the cut strings

birthday = "3/27/2020"
print(birthday.split("/")) # A list was made from the splitting of the string, it was split at the slash in the string
full_name = "Teddy Richard Smith Jr."
print(full_name.split(" ")) # Splits on the space

# The join() is a string method that combines the elements(string elements) of an iterable into a single string
fruits = ["Apple", "Kiwi", "Pear"]
print(" ".join(fruits))
print("!!!".join(fruits))
"""
"""
# List Unpacking
# Unpacking - We can unpack values from a list and store them in specific variables
user = ["Joe", "Bucky", 42]
first, last, age = user # Unpacks all at once from first to last
print(first) # The first value in the list is stored in a variable called first
print(last) # The second value in the list is stored in a variable called second
print(age) # The third value in the list is stored in a variable called third
# You have to unpack ALL the values of the list or we get an error.

# Unpacking with an asterisk (*) - Use the asterisk to gather any remaining unassigned values into a variable
item = [4, "Pizza", "Plain", 16.98]
quantity, *others, price = item # The asterisk must come before the variable name
print(quantity)
print(*others)
print(price)
print(others) # If you have just print(others) it will print out a new list because there is no asterisk
# The asterisk with a variable name unpacks all of the values in between the first and last elements

# Copying Lists - The copy method returns a SHALLOW COPY of an existing list meaning nested objects are NOT copied
# They will not be the same in memory even when copied
list1 = [12,9,3,7]
list2 = list1.copy()
print(list2 == list1)
print(list2)
# list2 = list1 # THIS IS NOT THE SAME AS COPYING. THIS IS SIMPLY ASSIGNING SINCE A DUPLICATE IS NOT MADE,
# THIS IS SIMPLY TWO VARIABLES POINTING TO THE SAME CONTAINER IN MEMORY

# Another way to copy (shallow copy) - Not as readable, but still works
one_list = [3,5,2,1]
second_list = one_list[0:2] # We can copy lists by creating slices of an entire list
print(second_list)

primary_list = [53,6,52,66]
secondary_list = primary_list[:]

# Deep Copy - The deepcopy() method will make a copy of a list AND any nested objects contained inside that list
import copy
list3 = [2,9,["a","b"],7]
list4 = copy.deepcopy(list3)
print(list4)
"""
"""
# TO-DO Excersise
todo_list = []
completed_tasks = []
while True:
    for i in range(len(todo_list)):
        print(f"{i+1}) {todo_list[i]}")
    print("Enter a command type h for help")
    command = input("> ")
    if command == "q":
        break
    elif command == "h":
        print("TODO LIST HELP")
        print("type q to quit")
        print("To add a todo to the list, type it and hit enter")
        print("To complete a todo enter its number")
    elif command.isnumeric():
        idx = int(command)
        if idx >= len(todo_list):
            print("THERE IS NO TODOS")
        else:
            finished = todo_list.pop(idx)
            completed_tasks.append(finished)
    else:
        todo_list.append(command)
if completed_tasks:
    print(f"You completed {len(completed_tasks)} tasks")
    for task in completed_tasks:
        print(f"*{task}")
print(todo_list)

L = [1,2,3,4,5,6,7,8,9,0]
sum = 0
for i in L:
    sum = sum + i
print(sum)

M = [1,3,5,6,11,23]
for j in range(0,len(M)):
    print(M[j] + M[j - 1])
"""
"""
# Dictionaries
# Accessing Data in Dictionaries - retrieve values using the dict[key] - Keys are values on the left side of colon
order = {"cost" : 3.5, "quantity" : 12}
print(order["quantity"]) # Uses square brackets, the curly braces are for creating a dictionary
# Adding and Updating Data in Dictionaries
order = {"cost" : 3.5, "quantity" : 12}
order["cost"] = 4.5 # This is updating the value, NOT the key
print(order) # This order dictionary will have a new value of 4.5 paired with the same key cost

order["cost"] = order["cost"] + 0.5 # This is another way of updating the value
# Now let's add a key value pair
order["day_of_purchase"] = "Thursday" # This syntax is adding a new key (called day_of_purchase) to the dictionary order
# The value of day_of_purchase is being set to Thursday
# All keys need to be unique, but the values do NOT have to be unique

# The get() method and "in" operator
# "in" works with dictionaries - ONLY LOOKS AT THE KEYS
price = {"arugala":1.10, "basil":2.54, "blackberries":4.93, "coconut":7.25, "fennel":3.36}
product = input("What are you buying ")
if product in price: # This works for KEYS
    price = price[product] # Remember the right hand side is checking the value of the given input in the dictionary
    print(f"Product is ${price}")
else:
    print("I don't have that today")
# The get() method will loo for a given key in a dictionary. If the key exists it will return the corresponding value
# Otherwise it will return None
order = {"cost" : 3.5, "quantity" : 12}
order.get("chicken") #This will return None since chicken is not in dictionary
order.get("quantity") # This will print 12

price = {"arugala":1.10, "basil":2.54, "blackberries":4.93, "coconut":7.25, "fennel":3.36}
product = input("What are you buying ")
price = price.get(product)
if price:
        print(f"Product is ${price}")
else:
    print("I don't have that today")
#pop() - This method accepts a key and it deletes the corresponding KEY_VALUE pair. It RETURNS the deleted value
dict1 = {"a":1,"b":1,"c":3}
pop_value = dict1.pop("b")
#popitem() - Deletes the most recently added value pair (it takes no arguments). It returns the item as a TUPLE
dict2 = {"d":4,"e":5,"f":6}
pop_item = dict2.popitem()
#clear() - Deletes all the items from the dictionary. It returns None. BUT IT KEEPS THE SAME CONTAINER
dict2 = {"d":4,"e":5,"f":6}
clear = dict2.clear()
# del - Removes items from a dictionary. Accepts KEYS. THIS IS NOT A METHOD
dict3 = {"g":7,"h":8,"i":9}
del dict3["g"]
# Dictionaries are mutable
d1 = {1:"one"}
d2 = d1 #d2 and d1 are referencing the same thing in memory
d2[2] = "two"
print(d2)
print(d1) # d1 and d2 will be the same since the are referencing the same thing in memory
print(d1 is d2) # This will be True
# If you use the copy method they will look the same but it references a different location in memory
d3 = d1.copy() # Looks the same, but d3 is another copy in a different location
print(d3 == d1) # Has the same quantities
print(d3 is d1) # This will be False because they are different references in memory
# Iterating Dicts: .keys(), .values(), and .items() - They return the keys, values, or both in an iterable format
test_scores = {"Marsha":78, "Baker":69, "Rosa":92, "Leif":97, "Peng":61, "Juan":73, "Esteban":84, "Amir":91, "Sakura":99}

print(test_scores.keys()) # This will return KEYS in an object called dict_keys. This is NOT a list
print(test_scores.values()) # This will return VALUES in an object called dict_values. This is NOT a list
print(test_scores.items()) # This will return BOTH keys and values in an object called dict_items. This is NOT a list

for student in test_scores.keys(): # Not needed to say .keys() with for loop, the default behavior is to iterate over keys
    print(student)

for student in test_scores: # This is the same as test_scores.keys()
    print(student)

for score in test_scores.values():
    print(score)

for item in test_scores.items():
    print(item)
# Finding the average of scores
total = 0
for points in test_scores.values():
    total = total + points
print(total/len(test_scores))

# Getting the test scores using the keys - This utilizes a for loop
for key in test_scores.keys():
    print(key, test_scores[key])

# Unpacking the items
for key, value in test_scores.items():
    print(key, value)

# Who had the highest score
max_score = 0
best_student = ""
for student, score in test_scores.items():
    if score > max_score:
        max_score = score
        best_student = student
print(f"Highest score was {max_score} by {student}")

# Fancy Dictionary Merging - Update method
# The update() method will update a dictionary using key value pairs from a second dictionary passed as the argument
orders = {"cost":3.5, "quantity": 12}
orders.update({"product":"taco","date":"03/14/2019"})
print(orders) # The same dictionary is now updated to print all of the newly added in key value pairs

d1 = {"a":1, "b": 2}
stuff = {"c":3, "d":4, "e":5, "a": "apple"}
d1.update(stuff) # All these new key value pairs will be added to d1, "a" update to have value "apple" NOT 1

# We can use two stars ** to combine multiple dictionaries into a new resulting dictionary
dict1 = {"a":1, "b":2}
dict2 = {"c":3, "d":4}
dict3 = {**dict1,**dict2} # Combines all key-values from dict1 and dict2, by unpacking each of the key-value pairs in a new dictionary
# The output will be {"a":1,"b":2,"c":3,"d":4}

# dict union - Order matters, works in Python 3.9
# Returns a new dict containing the items from the left and right dicts, in case of duplicate keys, right side wins
dict1 = {"a":1, "b":2}
dict2 = {"c":3, "d":4}
# dict3 = {dict1|dict2} This will not work since this is Python 3.6 not 3.9

# Lists and Dicts Combined
price = {"arugala":1.10, "basil":2.54, "blackberries":4.93, "coconut":7.25, "fennel":3.36}

produce = {"arugala": # This is a nested dictionary
               {"price":1.10,
                "qty":61,
                "is_organic":True,
                "producer":"Blue Kitty Farms"},
           "coconut":
               {"price":7.15,
                "qty":12,
                "is_organic":False,
                "producer":"Tropical Dream Farm"}
           }
print(produce["coconut"]) # This will print the dictionary within the key coconut since its a nested dictionary
# This is sort similar to printing the corresponding value, in this case its a nested dictionary
print(produce["coconut"]["producer"]) # Like lists the first [] will print the dictionary within coconut
                                      # The second [] will print the specific key nested/inside the coconut dict
print("Iterating over nested dictionaries")
for things in produce:
    print(produce[things])

# Mixing and matching lists and dictionaries
test_scores = {'Marsha': [78, 80, 89], # The values can be lists
               'Baker': [69,65,52]
               }

waitlist = [ # In this list EACH ELEMENT IS A DICTIONARY
    {
        "email": "tiff@gmail.com",
        "location": "USA",
        "first_name": "Tiff"

    },

    {"email": "john@gmail.com",
        "location": "USA",
        "first_name": "John"}

]

# Peak Dictionary Excersise
# The exercise uses the following "peak" dictionary:
peak = {
    "name": "Castle Peak",
    "height": 14264,
    "summit_log": [],
    "cell_reception": {
        "AT&T": "no reception",
        "T-Mobile": "poor"
    }
}
# Without touching the original variable declaration (above)...
# Add a "range" key to peak and set it equal to "Elk Mountains"
peak["range"] = "Elk Mountains"
# Add a "first_climbed" key to peak and set it equal to 1873
peak["first_climbed"] = 1873
# Whoops, there's a mistake with the peak "height".  Update it to 14265
peak.update({"height": 14265})
# Add a "Verizon" to the "cell_reception" dict and set it equal to "good"
peak["cell_reception"]["Verizon"] = "good"
# You just summited the peak! Add your name to the "summit_log" list
peak["summit_log"].append("Akshay")
print(peak)
# Let's rename "height" to "elevation":
# Remove "height" from the dict and store the result in a variable.
el = peak.pop("height") # The pop method pops a key and returns the value, we are saving the returned value to el

# Use the value for "height" and store it in the dict under they key "elevation"
peak["elevation"] = el

# Loop over the values in the dictionary and print them all out.  Don't ask why, just do it :)
for val in peak.values():
    print(val)

# Loop over the keys AND values in the dictionary and print them all out in the following format:
# key -> value
# (print an arrow between each pair)
for key, val in peak.items():
    print(f"{key} -> {val}")

# A huge earthquake/meteor/forestfire/tsunami has destroyed the peak.  Please empty out the entire dictionary.
peak.clear()
"""
"""
# Tuples
# Tuple Functionality
dishes = ("burrito", "taco", "fajita", "quesadilla")
print(dishes[2]) # This will print out fajita

colors = ("red", "orange", "yellow")
print(colors[0:2]) # We can do slices in Tuples

colors.index("orange") # This tuple method takes a value inside tuple and returns the position of the value,
# In this case the position of the orange is 1
colors.count("red") # This tuple method counts the number of times a value is inside the tuple
# The ONLY two tuple methods are count() and index()
print("red" in colors) # This is True since red is actually in colors

for c in colors:
    print(c)

#f you have a mutable element in tuple then you can change that specific element
stuff = (1,2,[])
stuff[2].append("lol") # This will ONLY add lol to the second element
print(stuff)
"""
"""
# Sets
# Sets are unique and un-orderd collections with NO DUPLICATE VALUES
# They contain IMMUTABLE ELEMENTS
evens = {2,4,6,8}
set() # Creates empty set. Using {} is invalid, since that means a dictionary

# Set Operators
# add() - Puts in a new value into a set
evens = {2,4,6,8}
evens.add(12) # This add 12 into the set called evens it will NOT do addition
print(evens)
# The output will be {2,4,8,6,12},

# remove() - Removes a single value from a set
langs = {"Python", "C", "Javascript"}
langs.remove("C") # This will remove "C" from the set, if you remove a value that is not in set we get an error
# The output will be {"Python, "Javascript"}

# discard() - Does the same as remove EXCEPT we don't get an error if we remove a value not in the set
langs = {"Python", "C", "Javascript"}
langs.discard("C++")

# clear() - Empties out a set
langs = {"Python", "C", "Javascript"}
langs.clear() # Empties out everything in the set the output is set()

# {1,2,3} is {1,2,3} # This is False since they are separate containers in memory just like lists
# {1,2,3} == {1,2,3} # This is True since it checks the values within the set

# Iterating over a set
new_evens = {2,4,6,8,10}
for number in new_evens:
    print(number)

# Set Operators Intersection, Union, Difference
# Intersection - Returns NEW set with members COMMON to left AND right, it is denoted with the "&" symbol
set_odds = {1,3,5,7,9}
set_prime = {2,3,5,7,9}
print("This is INTERSECTION", set_odds & set_prime)

# Union - Returns NEW set with members from LEFT AND RIGHT, denoted with the "|" symbol
web_dev = {"css", "python", "html", "js"}
data = {"python", "R", "SQL"}
print("This is UNION", web_dev | data)

# Difference - Returns NEW set with members from left NOT in right, denoted with the "-" symbol
# Here, ORDER MATTERS
print(web_dev, "This is web_dev")
print(data, "This is data")
print("This is the DIFFERENCE",web_dev - data) # Returns a new set with values ONLY unique to the left side(web_dev)
# If two sets have a common value, the difference operator will remove that the common value as well
"""
# Returning to Functions
# Introducing *args - The asterisk in front of args allows us to have any number of arguments/inputs
def average(*args): # The name does not have to be args it can be any name, BUT the "*" is needed for many inputs
    total = 0
    for arg in args:
        total = total + arg
    return total/len(args)
# The arguments put into args are a tuple

# Using *args
def count_stuff(*args): # Collects any number of arguments into a tuple called args
    print(f"You passed me {len(args)}")
print(count_stuff(1,4,2,True))

def sum(*nums):
    total = 0
    for num in nums:
        total = total + num
    return total

def silly(first, second, *others): # The first and second inputs/arguments are required, the rest are OPTIONAL
    print(f"First is {first}")
    print(f"Second is {second}")
    print(f"Others is {others}")

print(3,5,True, False, []) # 3 and five will be the parameters for first and second
# first has its own parameter(required), second has its own parameter(required), *others are optional
# Order matters

def silly_goose(num, *args):
  return args # This will return only the parameters for args NOT num, the first parameter will be set to num

# **kwargs - Key word arguments - Accepts any number of keys AND needs two asterisks
# Similar to *args except that it accepts key word arguments, meaning it needs to have a key value pair arguments
# Hence the name key word arguments
def demo(**kwargs):
    print(kwargs)

print(demo(color = "red", age = 12)) # This will be turned into a dictionary

def print_ages(**ages):
    for k,v in ages.items():
        print(f"{k} is {v} years old")

print(print_ages(max = 67, sue = 59, kim = 74))

# Parameter List Order - ORDER MATTERS
# (parameters, *args, default parameters, **kwargs) - This is the order
def display_info(person, *args, status = "single"):
    print(f"person is {person}")
    print(f"status is {status}")
    print(f"args is {args}")

print(display_info("colt", "purple", 4,5,6,7)) # colt is 1st parameter, purple and the rest are agrs,
# default parameter is last
# If you want to overwrite/change the default parameter value then you have to provide a keyword argument
def display_info(person, *args, status = "single"):
    print(f"person is {person}")
    print(f"status is {status}")
    print(f"args is {args}")

print(display_info("colt", "purple", 4,5,6,7, status = "married"))
# You have to explicitly say status="married(this is the keyword argument)
# If you put only married it will be considered part of the *args

def display_info(person, *args, status = "single", **kwargs):
    print(f"person is {person}")
    print(f"status is {status}")
    print(f"args is {args}")
    print(f"kwargs is {kwargs}")

print(display_info("colt",13,4,55,2,5, status = "married", age = 87, mood = "thrilled"))
# The person is colt, 13,4,55,2,5 are *args, status (which is the default parameter) was overwritten to be married,
# The rest are keyword(dictionary) arguments
# They contain a keyword and a value (age = 87, mood = "thrilled)
# If you do not provide a status this will come out to be single since it is a default parameter

# A Common Gotcha: Mutable Default Args - works for mutable objects only
def add_twice(val, lst = []): # This fuction expects two parameters, a value and a list to be passed in
    lst.append(val)
    lst.append(val)
    return lst # It appends the value to the list twice and returns the list

print(add_twice("hi", [1,2,3]))
print(add_twice("lol",["ha"]))

print(add_twice("yay")) # This works fine since it added "yay" twice
print(add_twice("boo")) # This added "boo" twice as well as "yay", It basically reused the same list from before
# It shares the default value is shared every function call

def add_thrice(val, lst = None): # The fix is to give lst the defalut value None
    if lst is None: # Use this conditional to get a new list
        lst = []
    lst.append(val)
    lst.append(val)
    lst.append(val)
    return lst
# Doing it this way gives a new list each time the fucntion is called
# What we do in the function will NOT be shared from one function call to the next
# If we create an object in the default parameter it gets reused like with the add_twice function
# Since the default is None it will create a new list each time

print(add_thrice(99))
print(add_thrice(0))



#Basic_List = [10,20,30,40,50,60,70,80,90,100]
#for l in Basic_List:
#    print(Basic_List[l])

P = [900,70,30,20000,600,40,50,80]
max_value = 0
for i in P:
    if i > max_value:
        max_value = i
print(max_value)

# Unpacking Args
def average(*args): # Can't pass a list since the function asks for individual arguments NOT a single collection of numbers
    total = 0
    for arg in args:
        total = total + 1
    return total/len(args)
# Having the * symbol in front of args allows python to unpack the elements of a list as individual arguments

nums = [7,4,9,2,11,2,3,4]
print(average(nums)) # This will give an error, to fix this we need to upack the list into individual arguments

# Upacking nums by doing *nums allows us to add new values
new_values = [*nums, 9999, True]
print(new_values)

# THE * IN FRONT OF ARGS(OR NUMS) CAN MEAN TWO DIFFERENT THINGS, 
# IT CAN MEAN COLLECTING ALL THE ARGUEMENTS(INPUTS) EX: OUR *ARGS
# OR IT CAN MEAN UNPACKING THE ELEMENTS EX: *NUMS
"""
"""
# ARGS/KWARGS Problem Set
# ============== PART 1 ==============
# Write a function called contains_pickle that accepts any number of arguments.
# The function should return True if it is passed "pickle" as one of the args
# Otherwise it should return False
def contains_pickle(*args):
    for argument in args:
        if "pickle" in args:
            return True
        else:
            return False

a = print(contains_pickle(44,"pickle", 99.3))
b = print(contains_pickle("asdas", 99, 66.4))
#  contains_pickle("red", 45, "pickle", [])  --> True
#  contains_pickle(1,2, "blue") ---------------> False
"""
# Another way of writing
def contains_pickle(*args):
    return "pickle" in args
"""
# ============== PART 2 ==============
# Write a function called count_fails that counts up the number of failing test scores it is passes
# It should accept any number of arguments
# It should return a count of how many args are less than or equal to 50
def count_fails(*args):
    count = 0
    for score in args:
        if score <= 50:
            count = count + 1
    return count

score = count_fails(33,55,22)
print(score)
# count_fails(99,48,79,36) -------> 2
# count_fails(85,78,91) ----------> 0
# count_fails(50,41,47,74,76,81) -> 3


# ============== PART 3 ==============
# Write a function called get_top_students that helps teachers find their A-grade students!
# It should accept any number of student=score keyword arguments like colt=78 or elton=98
# It should return a list containing the names of students who scored 90 or above
def get_top_students(**kwargs):
    best_students = []
    for student, score in kwargs.items():
        if score >= 90:
            best_students.append(student)
    return best_students

student = get_top_students(colt = 78, elton = 98, blue = 99)
print(student)
"""
"""
# WORKING WITH ERRORS
# Common Error Types
# The common errors - SyntaxError, NameError, IndexError, TypeError, ValueError, KeyError

# Raising Exceptions
#print("hello")
#"lol"[9] # At this point the code will stop running due to this error
#print("goodbye)")
# We can raise our own exception (force them to happen) whenever we want, using the raise keyword
# raise ValueError - We write the raise keyword and then followed by some sort of exception just like what is on the left of the dash
# raise IndexError - This is a generic error

#raise ValueError("invalid character") - We can provide a specific message when raising an exception (optional) look at the example on the left of the dash, anything can be written in the quotes
#raise ValueError("invalid character")
#int('f')

# When To Raise
# We do this anytime something truly exceptional occurs that we need to stop execution for or potentially handle(catch).
def get_user_name():
    inp = input("Please enter your name: ")
    if not inp.isalpha(): # The isalpha() is a method that determines if a string has alphabetical characters
        raise ValueError("Alpha chars only") # We are saying valueError because the error is what the string contains. It is not a TypeError because a string is valid, but numberical values that are strings are not valid
    return inp
# Running this program and entering invalid characters will give a ValueError("Alpha chars only") in the console

def register_user():
    user = get_user_name()
    Database.save(user) # This database does not exist, this is merely an example
# The database my have some rules such as the name CAN'T have numbers in it

# Usually its better to except a specific exception and handle it rather than handling any possible exception that can occur (try/except is good for handling the errors)
#try:
   # <code that could generate error>
#except:
   # <code that run if error is raised>
try: # We use try if we anticipate an error could occur. In this example someone could accidentally enter letters instead of numbers
    num = int(input("Enter a number: "))
except (ValueError, EOFError): # If you enter a valid input, then the except block will not run, we can chain multiple errors in the except, if we wanted to
    print("I will pick for you...7")
    num = 7

print(f"you enterted {num}")
# If a non-numerical character is entered this would still work because the try failed, which causes the except to run, in the except, default num is 7 which is valid allowing the rest of the code to run
# In this example, if we don't enter anything and hit CRTL D, we get end of file (EOF) error instead of ValueError since no value was entered. This is more of an edge case

# IF AN EXCEPTION IS RAISED IN THE TRY BLOCK, THEN THE EXCEPT BLOCK WILL RUN
# For try/except its better to except a specific exception and handle it, rather than handling any possible exception that could occur

# Multiple Excepts
try:
    num = int(input("Enter an integer: "))
    print(10/num)
except ValueError:
    print("That's not an int!")
except ZeroDivisionError:
    print("Can't divide by zero")
except EOFError: # If this were to run and we didn't enter anything in the try blocks, then the default num will be 0
    print("Ypu didn't enter anything")
    num = 0

# LBYL (LOOK BEFORE YOU LEEP) AND EAFP (EASIER TO ASK FORGIVENESS THAN PERMISSION)

#LBYL - Coding style where you explicitly test for pre-conditions before making calls or " leaping". Characterized by lots of if statements
# Here is an example
year = input("Enter a year: ")
if year.isnumeric(): # This is the look, it checks to see if the year is a numerical value
    year = int(year) # This is the leap, it converts the input to an int once we know the string input has numbers
else:
    year = 2025

# EAFP - Assume things will work, and catch exceptions if you are wrong. This is a style characterized by lots of try/except blocks - This is better
# Here is an example
try:
    year = int(input("Enter a year: ")) # Assume it will work - Try converting year to an integer
    # Assume it will work - We assume a number will be enterted for a year
except ValueError: # Catch the exception if try block does not work- The code runs if the variable year can't be cast as an integer
    year = 2025

# Both examples (EAFP and LBYL) work
"""
"""
# MODULES
# Working With Built-In Modules
    # Modules - Python files that contain code that cna be re-used in other files. Modules allow us to break up complex programs into smaller, more manageable pieces across multiple files.
    # Working with modules: Three types - Built-In, Custom, 3rd Party
    # Built-In - Comes with python that we can use IF WE IMPORT THEM, each module consists of methods and functionality bunduled together, we can find them in the python docs

# Importing More Built-In Modules
# Here is an example
import calendar # Imported the calendar module
leap_year = calendar.isleap(2010) # Using one of the methods in the module
print(leap_year)

moon_landing = calendar.weekday(1969,7,20)
print(moon_landing)

import math
constant = math.pi # The pi is not a method since it is a constant. We do not need to give any parameters since pi = 3.14
print(constant)

# Fancy Import Syntax
# Using the "as" keyword to import a module and give it your own custom name in the program - Example below
import random as rand # We imported the random module and gave it the name rand
rand.randint(1,6)
# Since the name has changed from random to rand, we can attach the method to the name rand instead of random. We can't say random.randint(1,6) because random word no longer exists after changing the name to rand
# IF WE WANT SPECIFIC PIECES OF A MODULE WE SAY from <module name> import <method(it does not have to be a method, it can be a class or constant> - Example below

from math import pi
# We ONLY have pi since that is all we imported from the math module

# We can fo multiple imports. Example below
from math import sin, cos, tan # Only these three are available since that is all we imported, to use others we have to import them
print(sin(1))
print(cos(1))
print(tan(1))

# We can import all pieces of a module individually using import *, but this NOT the best approach to importing
from math import * # This import EVERY SINGLE piece of the math. We don't want to do this because we can use the methods without knowing where they came from making it confusing. Example below
print(sqrt(4)) # This is valid but we don't know where this came from which can cause confusion
print(e) # This is valid but we don't know where this came from which can cause confusion
# Better to go with <import math> or <import math as mth> or <from math import pi, e, cos>. Its just easier to understand

# Creating Custom Modules
    # Step 1: Create a separate file (a .py file) either in the same or different folder give it a name
    # Step 2: In that file write some code
    # Step 3: Import that file that you gave the name for. You don't need to include the .py when using the import syntax
    # Example: I created a file called App_Udemy.py
import App_Udemy
print(App_Udemy.brand_colors)

# Another Way
from App_Udemy import brand_colors, mean
print(brand_colors)
print(mean([1,2,3,4,5,6,7,99]))

import art
art_work = art.art("woman")
print(art_work)

coffee = art.art("coffee")
print(coffee)

print(art.text2art("Hello", font = "block"))

from translate import Translator
translator = Translator(to_lang="te")
translation = translator.translate("Hello. How are you? Have a good day")
print(translation)
"""
