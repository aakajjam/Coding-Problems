"""
# Section 19: how to read text file content using Python

    # To create a text file select File->New->File->Give the file a name and add .txt at the end to say its a text file

# We use the open method to read a file. We need to pass the correct path
file = open("test.txt")

# This method reads ALL the contents of the file by default. We have to print in order to see the output
#print(file.read())

# The two in this methods reads the first two characters. If we want to read the first 5 characters, we do fice in the parenthesis
#print(file.read(5)) # Here the result will come as abc b. The space and newline in between are counted as characters


# Right now we have file.read(5) this read up to abc b (Check the test.txt file for reference).
# With these file.readline() methods coming after file.read(5) the pointer starts at the b character

print(file.readline()) # This will read the first line of our file.
# But in this scenario since we said file.read(5) first we have abc as first line and then a space/new line and then b. So the first readline() method will start from whereever file.read(5) left off at
# If we want the first line we have to comment out file.read(5) to get what we want (see the file called test.txt for reference)

print(file.readline()) # Since we already have a file.readline() already, this will read the second line
print(file.readline()) # This follows the same logic but this time it reads the thrid line

# If we do anything after file.read(5) it will start from the second line only. So make sure to use read or readline in general


# Make sure to close the file at the last line to prevent corruption. This is a good practice
file.close()
"""
"""
# Section 19 & 20: How to read all text file content using Python practice problem, Section 20: Importance of readLine and readLines methods in python 
# Interview Question. All examples shown are interview questions

file = open("test.txt")
#line = file.readline()
#while line != "":
#    print(line)
#    line = file.readline() # This is so we can move on to the second line and not get an infinite loop of the first line only.
    # Remember file is an object that we created since we attached a method to it (refer to Udemy_Problems in Git on methods)

# file.readlines() # This works like read(), THE DIFFERENCE IS EACH AND EVERY LINE WILL GET STORED IN ONE LIST. THE OUTPUT WOULD BE ['abc\n', 'bvdsf\n', 'cat\n', 'dog\n', 'elephant']
# The advantage of have the list is that it makes extraction, iteration and other things possible because lists are mutable. See iteration example below
for line in file.readlines():
    print(line)

# Doing this will not work. See below. This will not work because we already printed the lines using file.readlines(). 
    #   Since the lines have already been read and printed before the loop there are no more lines left to read and the loop will not print anyting
    
file = open("test.txt")
print(file.readlines())

for line in file.readlines():
    print(line)


file.close()
"""
"""
# Section 21: Writing Data into File using Python

# with open("test.txt") as file: # The with keyword opens our file name and saves it to a variable called file because of the keyword called as.
# With that we do not need to say file.close()

#with open("test.txt", "r") as file: # This opens the file in read mode, if we don't say the "r" by default the file will be in read mode
#with open("test.txt", "w") as file: # This opens the file in write mode

# We can also say file = open("test.txt", "r") to open file in read mode as well as file = open("test.txt", "w") to open file in write mode. But then we have to say file.close()

# Practice Problem:
    # Read the file and store all the lines in list
    # Reverse the list
    # Write the reversed list back to the file

with open("test.txt", "r") as reader: # Remember we open the file and save it to a variable called reader which because of the as keyword
    content = reader.readlines() # This reads all the lines of the file and stores them in a list and stores this in a variable called content which looks like ["abc", "bvdsf", "cat", "dog", "elephant"]
    reversed(content) # This is a list method that reverses all the elements in a list we say the reverse() and in the parenthesis we give our list name which looks like ["elephant", "dog", "cat", "bvdsf","abc"]
    # The reversed(content) the order of the elements are reversed but the original list remains unchagned until we use a for loop to write back to the contents of the file
    with open("test.txt", "w") as writer:
        for line in reversed(content):
            writer.write(line)

# The code explained
    # We opened and read our file using the with keyword and saved it to a variable called reader using the as keyword
    # reader.readlines() will go through all the contents of a file and put it in a single list. We save this list into a variable called content
    # The third line uses a list method called reversed() which we must give a list (which we called content) into the parenthesis. This will reverse the elements in the list
        # In the line saying code: with open("test.txt", "w") as writer, we opened same file again. This means that any existing content in the file will be overwritten WHEN WE WRITE TO IT

    # The part with the for loop is iterating over the elements that were reveresed (reversed(content)) and extracting each element
    # The part after the loop is writing the iterated element (the variable called line which is from the for loop) and writing it back to the file called writer thus overwritting file

"""
"""
# We can also do it this way as well
with open("test.txt", "r") as reader:
    content = reader.readlines()
    r = reversed(content)

with open("test.txt", "w") as writer:
    for line in r:
        writer.write(line)

# Though r is defined inside the with open("test.txt", "r") as reader it is still useable outside of the with statement
     # The reason for this is because when the with statement that opens the file has run it is exited, the file is automatically closed which means the variable we called r stil exists
     # Because of the fact that the with statement runs and exits our file in one line we have to open it again in order to write to it
"""
"""
# Section 25: Parse Content on Json File into Dictionary
# Most of the time we will have the Json content in another file

import json

courses = '{"name": "RahulShetty", "languages": [ "Java", "Python"]}' # To turn this into JSON-formatted string we need to have single quotes at the very start and end
# What we have is in fact a string variable because its in quotes

# loads method which comes with the import json will parse a json string and it returns a dictionary making it easier to access. See below how to use
dict_courses = json.loads(courses) # Again this will parse the json string and return a dictionary
print(dict_courses)

# Get me the first language taught by Rahul Shetty - Practice Problem
print(dict_courses["languages"]) # This returned the list which we have as out key ["Java","Python"]
list_of_languages = dict_courses["languages"][0] # Now we saved the list which into a variable that will call the first element in our key called languages

###############################################################################################################################################################

# Parse Content Present in Json FILE - This is different than parsing from a JSON string
with open("C:\\Users\\aksha\\Downloads\\JSON_file.txt") as f:
    data = json.load(f) # The load() method will read all the content from a FILE and return the content as a dictionary
    print(data)

# Print the second course title from the JSON that we did from above - Example Problem
print(data["courses"]) # This returns a list. This is because our data variable is a dictionary and our key called courses has a value made up of a list of elements.
print(data["courses"][1]) # Now this will return the index in our list
# Now to access our title we say this
print(data["courses"][1]['title']) # We are essentially parsing through different keys which are nested

# We can't say data["courses"][1][0] Since we are not accessing another index. We are accessing the value of the index. To access a value we use the key

# Now access the website in the JSON files
print(data["dashboard"])
print(data["dashboard"]["website"]) # Remember we don't say something like data["dashboard"][0] because the dictionary has another dictionary inside. The idnex works for a sequence (list or tuple).
# To access the keys within keys we give our variable name[outer key][inner key]

# When doing this understand what the keys are so it makes it easy to index and find the values
"""


