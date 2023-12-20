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
import requests as requests

from utilities.resources import ApiResources

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
# Section 24: How to Parse Json Strings in Python - Comes with Example
import json

courses = '{"name": "RahulShetty", "languages": [ "Java", "Python"]}' # To turn this into JSON-formatted string we need to have single quotes at the very start and end
# What we have is in fact a string variable because its in quotes

# loads method which comes with the import json will parse a json string and it returns a dictionary making it easier to access. See below how to use
dict_courses = json.loads(courses) # Again this will parse the json string and return a dictionary
print(dict_courses)

# Get me the first language taught by Rahul Shetty - Practice Problem
print(dict_courses["languages"]) # This returned the list which we have as out key ["Java","Python"]
list_of_languages = dict_courses["languages"] # Now we saved the list which outputs ["Java", "Python] into a variable
print(list_of_languages[0]) # Since dict_courses["languages"] gives us ["Java","Python"] all we have to do is specify the index to give us Java. Our index is 0

# The logic
    # First convert the json string into a dictionary using the loads() method and save it to a variable
    # Using the saved variable we can use that to get the value in the dictionary using its key the output is ["Java", "Python]
    # We saved that into a variable called list_of_lanugages because the value of our key called languges is a list with multile elements
    # Then using our variable called list_of_languages which is already set to ["Java", "Python"] we can specify the index to get out value
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

"""
# Section 26: Parsing Complex JSON with nested structure and extract values - See section 27 for more on the assert statement
# Practice Problem - Lets get the price of the course RPA, we just want the price, for this assume we don't know the order

import json
with open("C:\\Users\\aksha\\Downloads\\JSON_file.txt") as f:
    data = json.load(f)

    print(type(data["courses"])) # This will gives us the list which is our values in our dictionary called data
    for course in data["courses"]: # Here we are iterating over the list. Remember data is a dictionary and the value of data["courses"] (which is the syntax for accessing values) is a list
        print(course) # In each iteration of our list what is printed is the dictionary because each element is a dictionary with key value pairs
        if course["title"] == "RPA":# We can say course["title"] because course will take on each element in the list which is a dictionary,
            print(course["price"]) 
            # To access the value in the dictionary we need to give the key to our iterable which is called course and give the key which is called title thus we get course["title"]
            assert course["price"] == 45
            
# Remember course is the variable used to iterate over the list thus taking on or assigning itself what ever is in the list this case a dictionary
# After the first iteration course will be {'title': 'RPA', 'price': 45, 'copies': 10}, which means course = {'title': 'RPA', 'price': 45, 'copies': 10} - the first iteration only
# To get the value we want we need to check if our key title has a value RPA in each iteration, thus we say course["title"] to access the value in the dictionary
# The code we have is dynamic so even is we changed the order of the contents we will still get the same result - THIS IS HOW WE SHOULD WRITE OUR CODE
"""

"""
# Section 27: Compare two JSON Schemas using Python Dictionaries - With Example
import json

with open("C:\\Users\\aksha\\Downloads\\JSON_file.txt") as f:
    data = json.load(f)

    print(type(data["courses"]))
    for course in data["courses"]:
        print(course)
        if course["title"] == "RPA":
            print(course["price"])
            assert course["price"] == 45

with open("C:\\Users\\aksha\\Downloads\\JSON_file_1.txt") as fi:
    data2 = json.load(fi)

    print(data == data2) # This compares two dictionary objects. This will return false since we changed the content in JSON_file_1.txt
    assert data == data2 # To make our test pass or fail we use the assert statement, if we update the content of our file called JSON_file and make it match data in JSON_file_1 then it will be ture and it will pass

# The assert keyword is used when debugging code
# The assert keyword lets you test if a condition in your code returns True. If it does not return True we get an AssertionError
# Example below

x = "hello"
# If condition returns False, AssertionError is raised:
assert x == "goodbye" # Here we will get an AssertionError since x was set to "hello"

# This is similar to an if statement. The only difference is when the assert statement is False, we get an AssertionError. Used for verifying assumptions and catching errors
# Another explanation:
    # Let's say we want to calculate the area of a rectangle, we assume that our lenght and width are positive numbers, if someone gives negative numbers the assert statement will catch this and raise an error



# With an if statement, if something turns out to be false, the else runs and does not give us an error
"""

"""
# Quiz 2
# Practice Problem

import json

exampleJSON = (
    '{"test1":[{"lang1": "Java", "lang2": "Python", "other":["fortran", "go", "C"]}]}')

data = json.loads(exampleJSON)

print(data, ": This is data")

print(data["test1"], ": This is data[test1]")
print(data["test1"][0], ": This is data[test1][0]")
print(data["test1"][0]["lang1"], ": This is data[test1][0][lang1]")

print(data["test1"][0]["other"][1], ": This is ata[test1][0][other][1]") # Answer the question, what will this value give us

# The last print statement explained

# data is the name of our dictionary derived from the json.loads
# To access the key test1 we need to say data["test1] - This gives us a list which contains a dicitionary and a list contained in the dicionary - In our outer list we have one element which is the dictionary
# Since we have a list we can give an index, since we have one element in test1 - we write data["test1"][0] and we get {"lang1": "Java", "lang2": "Python", "other":["fortran", "go", "C"]}
    # Our syntax data["test1"][0] is a dictionary - we can see this by doing print(type(data["test1"][0]))


# Now, first is element is a dictionary, to access the values in the dictionary we give a key so we write data["test1"][0]["other"] "other" is the name of our key
# Since the value of our key called "other is a list we can specify the index again and we write data["test1"][0]["other"][1] we say index of 1 because "go" is the second index



# This is wrong because test1 maps to a list of dictionaries, not a single dictionary, in order to access "other" list we need to specify which dictionary inside the list you want to access
#print(data["test1"]["other"][1])

"""

"""
# Section 28: Install Python Requests Library for API automation

# This is from Library API which can be found on rahulshettyacademy.com -> sign in -> choose practice -> choose Library API

import requests

# BaseURI: http://216.10.245.166 - This is the base URL, meaning this is the server where the API is hosted
"""

"""
# Section 29: Understanding Get http request calls and get response using JSON method

import requests
import json

# The request is a class module. The get method is for the GET HTTP request. We need to give it inputs. Hover mouse over get() to see valid inputs
    #requests.get()


# This is the link we are using http://216.10.245.166/Library/GetBook.php?AuthorName=RahulShetty2
    # The URL is -> http://216.10.245.166/Library/GetBook.php
    # These are our parameters -> AuthorName=RahulShetty2
    # In an API the parameters and URL are separated by a question mark IF IT IS A GET HTTP METHOD: Sometimes we may have slash instead - then we have form parameters
    # Any parameters after the question mark are query parameters, our parameters are dictionaries

response = requests.get("http://216.10.245.166/Library/GetBook.php",
                        params= {"AuthorName": "Rahul Shetty2"},) # This is getting books based on author name, using query parameters

# Here we give the URL which is the information before the question mark, then our params which are the stuff after the question mark
# The stuff after the question mark will look like AuthorName=RahulShetty. Remember this is kwargs so it looks that way
# In the params section we give our AuthorName = RahulShetty inside a dictionary and set that equal to params, see above
# The third part may be optional - we will see more later, but still put a comma even if nothing is given

# We can see the parms in Postman when we select the GET method. Remember these are our query parameters
    # What we have in Postman we replicated with Python code


print(response.text) #response.text Shows the contents of the response using the .text method and makes it a string
print(type(response.text))
dict_response = json.loads(response.text) # Remember we are parsing a string, response.text is a string
print(type(dict_response)) # This will be a list since our output is in list format
print(dict_response[0]["isbn"])

# This is a faster way of doing than the lines above
json_response = response.json() # This will give us a response directly in JSON format

print("This is a JSON response", json_response)
print(type(json_response)) # We will get a list


# The GET method accepts parameters as a dictionary (remember kwargs)

# Breakdown of http://216.10.245.166/Library/GetBook.php?AuthorName=RahulShetty2
    # http:// - is the protocol over the internet
    # 216.10.245.166 - is the IP address of the server the URL points to
    # /Library/GetBook.php - this is the path to the resource on the server the URL is asking for. Here we are looking for a script called GetBook.php in a directory called "Library" on the server
    #?AuthoerName=RahulShetty2 - query paramter passed to the PHP script, the "?" separates the path from our query string. AuthorName parameter has value of RahulShetty2 telling PHP script to get books written by the author whose name matches
"""

"""
# Section 30: Validating response status code and headers using response object
import requests
import json

# json.load()

response = requests.get("http://216.10.245.166/Library/GetBook.php",
                        params= {"AuthorName": "Rahul Shetty2"},)



#response.text # Shows the contents of the response
print(response)
print(response.text) #response.text Shows the contents of the response using the .text method and makes it a string
print(type(response.text))
dict_response = json.loads(response.text)
print(type(dict_response)) # This will be a list since our output is in list format
print(dict_response[0]["isbn"], "This is out isbn value")

# This is a faster way of doing than the lines above
json_response = response.json() # This will give us a response directly in JSON format


print("This is a JSON response", json_response)
print(type(json_response)) # We will get a list

assert response.status_code == 200 # The response.status_code will give us our status code (200, 500, 400 etc)

print("These are the headers", response.headers) # Monitors the headers (key value pairs) of our responses (200,400,500)
# response.headers is returned as a dictionary

# Let's say we want to check the headers (you can see these in Postman). Here is how you do it
assert response.headers["Content-Type"] == "application/json;charset=UTF-8"

# Now lets try to retrieve the book details with ISBN RGHCC and we need to compare it to an expected book
expectedBook = {'book_name': 'Learn Appium Automation with Java', 'isbn': 'RGHCC', 'aisle': '22755'}

for actualBook in json_response:
    if actualBook["isbn"] == "RGHCC":
        print(actualBook, "This is the actualBook")
        assert actualBook == expectedBook
        print(expectedBook, "This is the expectedBook")
        break
"""


# Section 31: Understanding automating POST http request with Payload and headers

import json
import requests

addBook_response = requests.post("http://216.10.245.166/Library/Addbook.php", json={"name": "Learn Appium Automation with Java",
                                                                 "isbn": "bcd",
                                                                 "aisle": "4409fd",
                                                                 "author": "John foe"}, headers= {"Content-Type": "application/json"}, )

addBook_response.json() # Remember this will convert the response into JSON
print(addBook_response.json()) # If you run this again it will fail because, when we run it the first time, the request is added to database, if we do the same request again it will fail since the information is the same
# But in this case we will not get errors because it is a dummy API

response_json = addBook_response.json()
print(type(response_json))

# This output is a dictionary{'Msg': 'successfully added', 'ID': 'bcd22fd7'} but why did it add ID only and not the entire dictionary
    # ID was created by developers so it combines the strings from values of aisle and value of isbn




# Now lets say we want to extract ID of the book. Just do this
bookID = response_json["ID"]
print(bookID, "This is our ID")

# This section in a nutshell - With example above
    # In the POST method, data is sent as JSON, unlike GET which asked for params
    # In the POST method we need to give a payload as JSON parameter using the keyword json=, we can ignore the data parameter
    # We give the details from out JSON payload so the server can store these details in their database
    # The dictionary above is our JSON payload, this is our input payload and we are usually given this information
    # Last argument is option
    # We need to give headers, these are not mandatory but good to have. You can see the headers in Postman API Tool by putting URL in URL places, we are giving headers as JSON format so we need to give that info
    # All headers need to be given as a dictionary format


    # Payload is the input information given from the user, the key are given but the value we need to have someone provide us. This is the same as Body in Postman



# Visit reqests.readthedox.io to see the documentaion on the requests libarary


"""
# Section 32: End to end automation flow of API calls using Python

import requests
import json
from payLoad import *

addBook_response = requests.post("http://216.10.245.166/Library/Addbook.php", json= addBookPayload("uuii"), headers= {"Content-Type": "application/json"}, )


addBook_response.json() # Remember this will convert the response into JSON
print(addBook_response.json()) # If you run this again it will fail because, when we run it the first time, the request is added to database, if we do the same request again it will fail since the information is the same
# But in this case we will not get errors because it is a dummy API

response_json = addBook_response.json()
print(type(response_json))

# This output is a dictionary{'Msg': 'successfully added', 'ID': 'bcd22fd7'} but why did it add ID only and not the entire dictionary
    # ID was creaeted by developers so it combines the strings from values of aisle and value of isbn




# Now lets say we want to extract ID of the book. Just do this
bookID = response_json["ID"]
print(bookID, "This is our ID")


# Now to delete the Book. To Delete Book - To do this we need to delete the ID because that is what we created
response_deleteBook = requests.delete("http://216.10.245.166/Library/DeleteBook.php", json= {"ID" : bookID}, headers= {"Content-Type": "application/json"},)

# In the previous example we put the entire dictionary in headers, but in practice this is not good. To fix this we should create a file with a function that has the dictionary in it
    # To do this create a .py file which we called payLoad.py
    # Next create function, in this case ours is called addBookPayload
    # In the function set a variable called body (or any varaiable name) to a the dictionary we are given
    # Have the function return our dictionary in this case we said return body
    # Now since we created this py file externally we need to import it (import payLoad or say from payLoad import *) so we can use that functionality
    # Now we can set headers equal to our function in this case addBookPayload(), we need to make sure we give the string as an input for our parameter isbn,




assert response_deleteBook.status_code == 200
res_json = response_deleteBook.json() # This will hold a JSON formate, we will get a dictionary

print(res_json, "This is our res_json")
assert res_json["msg"] == "book is successfully deleted"# This key will be given by the developer


# If we ran this again we would get a success because the first time it adds a book and then finishes by deleting a book. The end result, the one we created is now gone making. So running again will recreate

 # Difference betweeen params and headers
    # Ask about the GetBook in URL, I thought we don't use the verb in the URI
    # Ask why I got the long response instead of a short one
    # Form parameters vs query parameters
    # What exactly are headers
"""

"""
# Section 33: Setting Global Configurations Using Python Cofig Object

import requests
import json
from payLoad import *
import configparser # To set up global configurations, we need to import a config parser
from utilities.configurations import *

config = configparser.ConfigParser()
config.read("utilities/properties.ini") # This is config object is reading our file


addBook_response = requests.post(config["API"]["endpoint"]+"/Library/Addbook.php", json= addBookPayload("uiii"), headers= {"Content-Type": "application/json"},)

# Here instead of giving the http://216.10.245.166 which points to one server, we gave the config which can point globally
# The sections are defined by square brackets and the variables below is the stuff in the section (refer to the properties.ini file)
# Here we called on congifparser and saved it to a variable called config
    # This allows us to read our file
    # Once the file is read, we can give the section which is called ["API"] and what we want in our specific section ["endpoint"]
# In essence after reading saying config["API"]["endpoint"] in our post method will know where to go and what to pull (first the section and then the stuff in the section we want)
# Note we give the + sign to concatenate and separate the string


addBook_response.json() # Remember this will convert the response into JSON
print(addBook_response.json()) # If you run this again it will fail because, when we run it the first time, the request is added to database, if we do the same request again it will fail since the information is the same
# But in this case we will not get errors because it is a dummy API

response_json = addBook_response.json()
print(type(response_json))


# Now lets say we want to extract ID of the book. Just do this
bookID = response_json["ID"]
print(bookID, "This is our ID")


# Now to delete the Book. To Delete Book - To do this we need to delete the ID because that is what we created
response_deleteBook = requests.delete(config["API"]["endpoint"]+"/Library/DeleteBook.php", json= {"ID" : bookID}, headers= {"Content-Type": "application/json"},)


assert response_deleteBook.status_code == 200
res_json = response_deleteBook.json() # This will hold a JSON formate, we will get a dictionary

print(res_json, "This is our res_json")
assert res_json["msg"] == "book is successfully deleted"# This key will be given by the developer

#############################################################################################################

# There is another way to do this that is much easier
import requests
import json
from payLoad import *

from utilities.configurations import getConfig
# This is saying from our utlities package we created we want the configuations file we created hence the .configurations
# We are importing our function getConfig from that file

import configparser # To set up global configurations, we need to import a config parser
config = getConfig()


# We don't need the two lines below anymore
    #config = configparser.ConfigParser()
    #config.read('utilities/properties.ini')

# We had this originally but we can put this under a function in a different file and call the file using import
# We can then call the function using whatever the function name is (refer to the configurations.py file under the package utilities)
# This just reduces the number of lines of coding
# Now that those two lines are in a function in a different file we can import the function from our file
    # fom utilities.configuarations import getconfig()


addBook_response = requests.post(config["API"]["endpoint"]+"/Library/Addbook.php",
                                 json= addBookPayload("uuii"),
                                 headers= {"Content-Type": "application/json"}, )
# Here instead of giving the http://216.10.245.166 which points to one server, we gave the config which can point globally
# The sections are defined by square brackets and the variables below is the stuff in the section (refer to the properties.ini file)
# Here we called on congifparser and saved it to a variable called config
    # This allows us to read our file
    # Once the file is read, we can give the section which is called ["API"] and what we want in our specific section ["endpoint"]
# In essence after reading saying config["API"]["endpoint"] in our post method will know where to go and what to pull (first the section and then the stuff in the section we want)
# Note we give the + sign to concatenate and separate the string


addBook_response.json() # Remember this will convert the response into JSON
print(addBook_response.json()) # If you run this again it will fail because, when we run it the first time, the request is added to database, if we do the same request again it will fail since the information is the same
# But in this case we will not get errors because it is a dummy API

response_json = addBook_response.json()
print(type(response_json))


# Now lets say we want to extract ID of the book. Just do this
bookID = response_json["ID"]
print(bookID, "This is our ID")


# Now to delete the Book. To Delete Book - To do this we need to delete the ID because that is what we created
response_deleteBook = requests.delete(config["API"]["endpoint"]+"/Library/DeleteBook.php",
                                      json= {"ID": bookID},
                                      headers= {"Content-Type": "application/json"},)


assert response_deleteBook.status_code == 200
res_json = response_deleteBook.json() # This will hold a JSON formate, we will get a dictionary

print(res_json, "This is our res_json")
assert res_json["msg"] == "book is successfully deleted"# This key will be given by the developer
"""

"""
# Section 34 Optimizing resources and payload from externally as reusable data

import requests
import json
from payLoad import *
from utilities.resources import * # We wrote code in resources.py file and since its from the utilities package we say utilities.resouces. Inside our resources.py file we have a class


from utilities.configurations import getConfig
# This is saying from our utlities package we created we want the configuations file we created hence the .configurations
# We are importing our function getConfig from that file

import configparser # To set up global configurations, we need to import a config parser
config = getConfig()


url = config["API"]["endpoint"]+ApiResources.addBook # The variables we used here came externally see the explanation below
# Originally we wrote this entire URL in our POST, GET, and DELETE request. But we can save this to a variable for cleaner code
#The /Library/Addbook.php is a resource which we gave but in our resources.py file we wrote a class that has the resources defined and saved to a varible
# Remember config["API"]["endpoint"], the config is holds the getConfig() function which imports config parser and reads a file (refer to configurations.py file)
# The thing we are getting our ["API"]["endpoint"] is from our properties.ini file (refer to the properties.ini file) which is being read in our configrations.py file

headers = {"Content-Type": "application/json"}

addBook_response = requests.post(url, json= addBookPayload("uiuii"), headers= headers, )


addBook_response.json() # Remember this will convert the response into JSON
print(addBook_response.json()) # If you run this again it will fail because, when we run it the first time, the request is added to database, if we do the same request again it will fail since the information is the same
# But in this case we will not get errors because it is a dummy API

response_json = addBook_response.json()
print(type(response_json))


# Now lets say we want to extract ID of the book. Just do this
bookID = response_json["ID"]
print(bookID, "This is our ID")

another_url = config["API"]["endpoint"]+"/Library/DeleteBook.php"

# Now to delete the Book. To Delete Book - To do this we need to delete the ID because that is what we created
response_deleteBook = requests.delete(another_url, json= {"ID" : bookID}, headers= headers,)


assert response_deleteBook.status_code == 200
res_json = response_deleteBook.json() # This will hold a JSON formate, we will get a dictionary

print(res_json, "This is our res_json")
assert res_json["msg"] == "book is successfully deleted"# This key will be given by the developer
"""

# Section 35: Authenticating APIs using Python Automation auth method
# Section 35: Authenticating API's useing Python Automation auth method - Example Practice Problem
# Additional practice can be at httpbin.org
"""
import requests
import json
from payLoad import *
from utilities.resources import * # We wrote code in resources.py file and since its from the utilities package we say utilities.resouces. Inside our resources.py file we have a class

from utilities.configurations import getConfig
# This is saying from our utlities package we created we want the configuations file we created hence the .configurations
# We are importing our function getConfig from that file


import configparser # To set up global configurations, we need to import a config parser
config = getConfig()

url = config["API"]["endpoint"]+ApiResources.addBook # The variables we used here came externally see the explanation below
# Originally we wrote this entire URL in our POST, GET, and DELETE request. But we can save this to a variable for cleaner code
#The /Library/Addbook.php is a resource which we gave but in our resources.py file we wrote a class that has the resources defined and saved to a varible
# Remember config["API"]["endpoint"], the config is holds the getConfig() function which imports config parser and reads a file (refer to configurations.py file)
# The thing we are getting our ["API"]["endpoint"] is from our properties.ini file (refer to the properties.ini file) which is being read in our configrations.py file

headers = {"Content-Type": "application/json"}

addBook_response = requests.post(url, json=addBookPayload("uuii"), headers= headers, )

addBook_response.json() # Remember this will convert the response into JSON
print(addBook_response.json()) # If you run this again it will fail because, when we run it the first time, the request is added to database, if we do the same request again it will fail since the information is the same
# But in this case we will not get errors because it is a dummy API

response_json = addBook_response.json()
print(type(response_json))


# Now lets say we want to extract ID of the book. Just do this
bookID = response_json["ID"]
print(bookID, "This is our ID")



another_url = config["API"]["endpoint"]+"/Library/DeleteBook.php"

# Now to delete the Book. To Delete Book - To do this we need to delete the ID because that is what we created
response_deleteBook = requests.delete(another_url, json= {"ID" : bookID}, headers= headers,)


assert response_deleteBook.status_code == 200
res_json = response_deleteBook.json() # This will hold a JSON formate, we will get a dictionary

print(res_json, "This is our res_json")
assert res_json["msg"] == "book is successfully deleted" # This key will be given by the developer



# Authentication
# If there authentication required for sending an API how do we handle this through automation
    # To do this we need to give a user and pass. This is using the auth parameter auth = (user, pass)
    # Ex: r = requests.get("https://api.github.com/user", auth = ("user", "pass") - Here we give a user and pass to get stuff from this url
    # To access you need to authenticate otherwise you can't access

url = "https://github.com/aakajjam/Coding-Problems"
access_token = {"Authorization": "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"}
github_response = requests.get(url, verify=False, auth=("akshaymusic101@gmail.com", "Sanatana@@2013"), headers= access_token)
# The verify=False disables SSL certificate verification, in other words disables the security

print(github_response.status_code, "This is our status code")

# The access token is good for 30 days, that is what I set it to in github
"""

"""
# Section 37: Importance of Session Managing in API Testing

# Authentication
# If there authentication required for sending an API how do we handle this through automation
    # To do this we need to give a user and pass. This is using the auth parameter auth = (user, pass)
    # Ex: r = requests.get("https://api.github.com/user", auth = ("user", "pass") - Here we give a user and pass to get stuff from this url
    # To access you need to authenticate otherwise you can't access

import requests
session = requests.session() # Here we created an instance of the requests.session() class which we assigned to a variable called session
session.auth = auth=("akshaymusic101@gmail.com", "Sanatana@@2013") # auth is an attribute of the session class

url = "https://github.com/aakajjam/Coding-Problems"
access_token = {"Authorization": "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"}
github_response = session.get(url, verify=False, auth=("akshaymusic101@gmail.com", "Sanatana@@2013"), headers= access_token)

# We can change requests.get to session.get, session and requests are essentially the same which is why we can change requests to session
# While both are the same, session has the capability and knowledge of authentication as well
# That is why session is the same as requests plus any other configuations we provide as part of the session method (i.e auth=("akshaymusic101@gmail.com", "Sanatana@@2013"))

print(github_response.status_code, "This is our status code")

second_url = "https://github.com/aakajjam/Coding-Problems" # api.github.com is the base URL, /user/repos is the resource

response = session.get(second_url)
# Here when we say session, we don't need to give auth=("akshaymusic101@gmail.com", "Sanatana@@2013")
# That is because we added the authentication property to our session variable (session.auth = auth=("akshaymusic101@gmail.com", "Sanatana@@2013")
# It will authenticate first and then execute our URL saved in variable called second_url

print(response.status_code, "This our response code for our second_url")
# This will give 401 if we don't give authorization
# If we don't give the authentication details github won't know which user we are asking for



# WHY WE USE THE SESSION MANAGER
    # Everytime we make a call for that user for all the repositoties, we have to write the authentication each time
    # So, to combat the redundancy, we can write our code globally, to apply to all github related URLs - This requires a session manager

# New syntax
# To create an instance of a class provided by a library in Python, you typically follow these steps:
    # Import the necessary module or library containing the class you want to instantiate.
    # Call the constructor of the class to create a new instance.
    # Optionally, assign the instance to a variable for further use.

# Example - This relates to the first two lines of code for Section 37
# import library_name (import requests)
# instance = library_name.ClassName() (session = requests.session())
# instance.method() (session.auth)
"""


"""
# Section 38: Send and Manage Cookies for API request calls
import requests

#http://rahulshettyacademy.com - This site has a cookie that shows the visit month
#visit-month is the cookie

# If we don't pass the cookie, it will load the website from the actual server
cookie = {"visit_month": "February"}
response = requests.get("http://rahulshettyacademy.com", cookies= cookie) # Cookies must be sent in dictionary format
print(response.status_code, "This is our cookies response code") # This gave the 200 code but we don't know if this was accepted by the server

# Practice available on httpbin.org


# We can use session manager here as well
session = requests.session()
session.cookies.update({"visit-month":"February"}) # Our session is loaded with the cookie {"visit-month": "February"}

res = session.get("http://httpbin.org/cookies", cookies= {"visit-year":"2022"})
# When we hit this request, we are hitting the URL and we have the cookie next it in the cookie parameter.
# Then {"visit-month": "February"} will be added by default since we are using session.get
# This is loaded with the cookie "visit-month": "February"}

print(res.text, "This is our return body response") # The .text will return a json

# If we have common cookie, head or authentication which will be frequently used across all endpoint
# Then use a session manager to update

# If we change the line with session.get to requests.get, it will not return the visit-month, it will return visit-year

# Why is this returning visit-month and visit year? - The reason is because we updated this with session.cookies.update
    # Then the session.get() is executed returning the visit-month and visit-year
    # Ask Sukanya or Logesh

# WHY WE DO THIS - Ask Sukanya or Logesh
"""

"""
# Section 39: Timeout and Redirection Attributes in making request calls

# When we hit the site rahulshettyacademy.com, it will one URL and then the rahulshettyacademy.com
# The first response we get is a 301 resonse and then after redirect we get the 200
# When we do the response.status we get the final status code 200, 400, 500. It will not show the history

import requests

# http://rahulshettyacademy.com - This site has a cookie that shows the visit month
# visit-month is the cookie

# If we don't pass the cookie, it will load the website from the actual server
cookie = {"visit_month": "February"}
response = requests.get("http://rahulshettyacademy.com", cookies=cookie)  # Cookies must be sent in dictionary format

#print(response.history, "This shows the redirect status code")  # This will show if there are redirects
print(response.status_code, "This is our cookies response code")  # This gave the 200 code but we don't know if this was accepted by the server

# Redirection is common due to things like security implementation

# We can use session manager here as well
session = requests.session()
session.cookies.update({"visit-month": "February"})  # Our session is loaded with the cookie {"visit-month": "February"}

res = session.get("http://httpbin.org/cookies", cookies={"visit-year": "2022"})
# When we hit this request, we are hitting the URL and we have the cookie next it in the cookie parameter.
# Then {"visit-month": "February"} will be added by default since we are using session.get
# This is loaded with the cookie "visit-month": "February"}

print(res.text, "This is our return body response")  # The .text will return a json

# If we have common cookie, head or authentication which will be frequently used across all endpoint
# Then use a session manager to update

# If we don't want to redirect and simply want to go directly, here is what we can do
no_redirect = requests.get("http://rahulshettyacademy.com", allow_redirects= False, cookies= cookie)
# This will stop at the 301
# To get a 200 code a redirect is reqired since we set allow_redirects= False, it will stop the redirect and end at status code 301

print(no_redirect.status_code == 301, "This will stop at 301")


# So far we had instant response, but with heavy load, the response may be delayed
# We need to give a mechanism to wait a certain amount of time and then give the response

time_out = requests.get("http://rahulshettyacademy.com", allow_redirects= False, cookies= cookie, timeout= 10)
# This will wait one second and then give the response back - IMPORTANT

# Find out why timeout is happening 1-2 seconds instead of 10 seconds

print(time_out.status_code, "This is our timeout delay")
"""

"""
# Section 40: Sending Attachments through POST request call using Files Dictionary Object
import requests

# You can check the POST Multiple Multipart_Encoded Files on the site requests.readthedocs.io
# Also look at petstore.swagger.io/?displayOperationId=false
# petstore.swagger.io/ - This is the base URL

# POST /pet/{petId}/uploadImage - This is the endpoint, The parameters are petId (required), additionalMetadata, file, this is the POST request

# Attachments

url = "https://petstore.swagger.io/v2/pet/9843217/uploadImage" # The valid petID is 9843217. Put this where it says {petID}

# Here the file that we want to give as an attachment is in dict format. The key is file and the value is the file name (C:\\Users\\aksha\\OneDrive\\Pictures).
# We want to open with in what permission (rb which is read)
files = {"file" : open("FinalTree.png", "rb")}

attachment_response = requests.post(url, files= files) # Here we are submitting a POST call with the file attachment
print(attachment_response.status_code)
print(attachment_response.text)

# In the response (if successful) we get additionalMetadata: null\nFile. We get this since we did not send anything

# Basically for the petID of 9843217 we successfully uploaded an image file

# This is how you can send ANY file as an attachment to your API request calls


# Section 41 is just a code snippet download, there are no lessons there

# Section 42: Setting up MYSQL Instance to drive the date from Python Code - This is a video on the installation process
"""

"""
# Section 43: Setup Database with the Example Table Data and start Connection

import mysql.connector

connection_object = mysql.connector.connect(host= 'localhost', database= 'PythonAutomation',
                        user= 'root', password= 'root')

print(connection_object.is_connected(), "This is TRUE, connection was successful.")
# The .is_connected method will tell us if the connection to the server and database was successful or not

# The .connect is a method which expects four parameters. The parameters are host, database name, user, password
# Since our database is stored in our local server (aka our computer we can give the host as 'localhost')
# This method will return a CONNECTION OBJECT
"""


"""
# Section 45: Executing Queries on to the Database from Python Code
import mysql.connector
connection_object = mysql.connector.connect(host= 'localhost', database= 'PythonAutomation',
                        user= 'root', password= 'root')

print(connection_object.is_connected(), "This is TRUE, connection was successful.")

cursor = connection_object.cursor() # This is like a pointer to each row. This is needed to execute/run and work with queries. This communicates with MYSQL database
cursor.execute('SELECT * FROM CustomerInfo') # The execute method ONLY runs the query. Inside the parenthessis we can put our queries inside single quotations
row = cursor.fetchone() # This will give the first row
print(row) # This prints a tuple. SQL results come in the form of tuples


row_all = cursor.fetchall() # This prints all the REMAINING row since the fetchone method printed the previous row. The cursor/pointer is now moving on to the next rows and printing them all
print(row_all)
# For ex: If the cursor/pointer is pointed at the 3rd row and there are five rows. The fetchall method will give the remaining rows


# Fetchall will return a LIST while fetchone returns a TUPLE
# Everytime you call fetchone the cursor will move to the next row
# Calling on fetchall AFTER using fetchone will print that come after the last printed row



# Section 45 Practice Problem: Fetch all the records of the customer and the sum of the Amount(column name in the CustomerInfo Table)

# Import the mysql.connector library
import mysql.connector

# Create a connection object
connection = mysql.connector.connect(host= 'localhost', database= 'PythonAutomation',
                        user= 'root', password= 'root')

# Validate the connection is successful
print(connection.is_connected(), "Connection was successful")

# Create a cursor method that will communicate to the MYSQL server
table_rows = connection.cursor()
# The variable name (here called table_rows) is set to the cursor method and has to be used to execute and fetch the queries, otherwise no connection occurs between python and the MYSQL server
    # Since table_rows is set equal to the connection.cursor (which communicates to MYSQL server) therefore only that variable can communicate with the MSQL server
    # Therefore only table_rows variable can execute and fetch the queries since that variable has the .cursor method set to it

# Write the SQL query in the parenthesis of the execute method - this will run the query
table_rows.execute('SELECT Amount FROM CustomerInfo')

# Fetch all the from the query
amount = table_rows.fetchall()

# Save the date to a variable and print - Remember it will return a LIST
print(amount) # Here we get tuples inside of a list. Our elements are tuple data types NOT integer datatypes

# Create/Instantiate a variable for the sum and set it to 0
sum = 0

# Iterate through the list
for i in amount:

# Iterate through the tuple datatype(which is variable called i) to get to the integer datetype(which is the variable called j) - Otherwise we can't add any numbers
    for j in i:

# Add the values (variable called j) to our sum which we initialized as 0
        sum = sum + j

# Print the final sum
print(sum)

connection.close() # Close the connection after otherwise execution of the queries will be slow
"""

"""
# Section 46: Iterate Over Database Table Results Set From Python and Parse The Results
import mysql.connector

conn = mysql.connector.connect(host='localhost', database='PythonAutomation',
                               user='root', password='root')
cursor = conn.cursor()
print(conn.is_connected(), "Connection Successful")


new_query = "update customerInfo set Location = %s where CourseName = %s"  # This is our query but we can put it as a string

# The actual query is (update customerInfo set Location = 'US' where CourseName = 'Jmeter') but we can't have strings inside string
# Since we can't have strings inside strings we change the part our values from '' to %s

data = ("Denmark", "Jmeter")
# The data variable holds the actual values of what we have to provide in the %s portion, we give this as a tuple

cursor.execute(new_query, data)
# Once this runs, the updates will be seen in MYSQL workbench NOT in Pycharm, to see the new updates we have to execute another query that will return the updated results

conn.commit()
# Since we are updating we need to commit our changes, we have to use the variable attached to the mysql.connecor.connect (which is called conn) since that is what makes the connection


cursor.execute("SELECT Location FROM CustomerInfo")
# Here we are running the query again to see the updated values

updated_query = cursor.fetchall() # Fetches all the values
print(updated_query)
print(updated_query[4])
# Now we can see Denmark in Pycharm

# For the line that says cursor.execute(new_query, data) see explanation below
    # Instead of hard coding a query inside the execute method, we wrote the entire query as a string and stored it to a variable called new_query
    # Since we are updating the values in our query, we stored those in the data variable as a tuple
    # When we execute the actual query, our variable (called new_query) will run the SQL query we gave along with the values we want to update (since our query is about updating)
    # Order matters, so UK will go for the first %s and Jmeter will go for the %s

"""

# Section 46 Practice Problem: Like we did for update, try delete


"""
# Section 47: Create Connection Utility and Pass the SQL Connection Externally Into Test
# View the configurations.py file for reference

from utilities.configurations import *
conn = getConnection()
print(conn.is_connected())
cursor = conn.cursor()
cursor.execute('SELECT * FROM CustomerInfo')
result = cursor.fetchall()
print(result)

# Imported everything from the utilities.configuarions file we created
# Called on the getConnection() function
# All the code in the getConnection() function ran and was saved in the variable called conn which we returned (in this case establishing a connection to the MYSQL server)
    # Now we can use the conn variable for other things
# Validate the information saved conn variable has a successful connection
# Add a cursor method to the conn object (essentially adding a line of communication to an a connected server - in this case the MYSQL server)
# Run a query
# Fetch the results and save to a variable
# Print the results

########################################################################################################

# We have global properties in the mysql connector (host, user, password, database)
# This should come from the .ini file
# Even the code related to establishing a database connection (aka the mysql connector code) should not be in a test file
# Instead, the code related to the connection should come from a utility file

########################################################################################################
import configparser

import mysql.connector
from mysql.connector import Error


def getConfig():
    config = configparser.ConfigParser()
    config.read('utilities/properties.ini')
    return config
# This is reading our .ini file and returning config

connect_config = {'user': getConfig()['SQL']['user'],
                  'password': getConfig()['SQL']['password'],
                  'host': getConfig()['SQL']['host'],
                  'database': getConfig()['SQL']['database']}


def getPassword(password):
    return password


def getConnection():  # We can call on this function when creating a database connection - Lecture 47 Create Connection Utility and pass the SQL Connection Externally
    try:
        conn = mysql.connector.connect(**connect_config) # The two stars indicate we are giving a dictionary argument
        if conn.is_connected():
            print("Connection Successful")
            return conn
    except Error as e:
        print(e)

# The Error in the except clause comes from importing the Error module from mysql.connector
# It will tell us what went wrong if something does go wrong
# All the code that runs is saved to a variable called conn which is returned if all goes well
# All the saved info that is in the conn variable can be used later

connect_config = {'user': getConfig()['SQL']['user'],
                  'password': getConfig()['SQL']['password'],
                  'host': getConfig()['SQL']['host'],
                  'database': getConfig()['SQL']['database']}

# The code above explained: Lecture 47: Create Connection Utility and pass the SQL Connection Externally
# Remember, we want to get the values globally
# To get values globally we have to use a .ini file
# We created a .ini file called properties.ini which has the ending path as utilities/properties.ini
# If you see the getConfig function, we are reading the utilities/properties.ini file and returning that information

# In the connect_config, we have a dictionary that then calls the getConfig function which therefore reads the contents of the utilities/properties.ini file ('user': getConfig())
# In the utilities.properties.ini file we want to use the SQL section, so we mention the SQL section in square brackets ('user': getConfig()['SQL'])
# In the SQL section we want to use the keys user, password, host, database ('user': getConfig()['SQL']['user'] - ['user'] is essentially a key that has a value associated with it called 'root'
# We would do the same for the rest of the keys (password, host, database)

# Why use the .ini file?
    # This is essentially a configuation file
    # That means Config files are used to store key value pairs or some configurable information that could be read or accessed in the code and at some point, of time
    # If the configuation ends up changing we can just change the configuation in the .ini file (aka changing the values associated with the keys user, password, host, database)
    # Changing the configuation means we don't have to change the rest of the code
    
# Because we did all of the explained steps in the dictionary (which is assigned to our variable called connect_config) 
# Now, in the getConnection function we can replace the stuff inside .connect with our dictionary variable connect_cofig
# We can replace the stuff inside .connect because we are calling the getConfig to read the .ini file, choosing the SQL section and choosing our keys with associated values all at once
"""


# Section 48: Integrate Database Results into API Test Data to Build a Functional Flow

# Section 51: Install Behave and download Python Professional edition

# Section 52: Create Step Definition file with auto generated syntaxes and annotations

    # See python file called stepimplementation.py file

    # In the features directory we have to create another directory ONLY - Behave will not understand the directory is somewhere outside

    # Inside of our function we have to give a variable called context - IMPORTANT

    # The feature file has our test cases written in BDD

    # Notes for Lecture 52:
        # We created a features directory with the .features extension for use of BDD format called features.features
        # Inside the features directory we created another directory called steps
        # Inside that directory we created a python file called stepsimplementation.py
        # With the .py file we can integrate our BDD steps with the code using the decorators which are the lines that say @given, @when, @then

        # The @given, @when, @then are step definitions have these key points:
             # They are reusable: Step definitions can be reused across multiple feature files and scenarios, making it easier to maintain your test code.
             # Mapping of steps: Each step definition is mapped to a step in the feature file based on the text specified in the Given-When-Then annotations.
             # Test executions: During test execution, the BDD framework identifies and runs the step definitions that match the steps in the feature files,
               # ensuring that the behavior is tested as intended.


# Lecture 53

# Inside our function we have to give a variable called context - IMPORTANT

# Notes for Lecture 53:
    # For example the variable url is inside the function called step_impl, which means the variable scope is inside the function only
    # In other words url variable can't be used outside the function
    # This is where context comes into picture
    # Putting context. and then our variable name makes the variables global or in other words usable outside the function

    # If you want to run all the features, we type behave in our terminal
    # If you want to run one feature, then we type behave and our feature file name in this case features/BookAPI.feature
    # To see the logs we type --no-capture after typing behave or our feature file name



# Lecture 54: Implement Hooks for the scenarios by defining environment.py file

# Notes for Lecture 54
# In our BDD step, we are adding the book, and then we are deleting the book for clean up
    # Think of deleting as a cleaning script because we don't want to add multiple books to the database
    # We can write delete in a separate file. Cucumber gives us hooks that helps with the cleaning

    # The environment.py module may define code to run before and after certain events during your testing - must be wrtten in environment.py file
    # So after successful execution of our test case in BookAPI.feature, we want to clean the data by removing the book
    # There is a method called after scenario or before scenario - after_scenario(context, scenario), before_scenario(context, scenario)
        # After our AddBook test case has run, then python will check if there are any hooks like after scenario
        # For before scenario - it means before starting the test case execution, the before_scenario will run first and then our test case
        # There are methods for before/after feature as well - feature is a collection of scenarios
        # This ALL has to be written in environment.py module, ONLY then behave can search and find the hooks
        # Before any feature/scenario has run, python will check for hooks in the environment.py file

        # If you do a before scenario in for Hooks, python will run the hook before each and every scenario - same for after scenario
        # If you do a hook for before but for FEATURES, that will run once before our scenarios are executed (but before hook for feature will run again for the next feature)
            # Same for after feature
    # If you are reusing variables that were defined in other files or functions - remember to use the .context and the variable name to make the variable global

    # The file should go in the FEATURES DIRECTORY
    # Important note about hooks, even if the scenario or feature fails, the hooks will still run.

    # Syntax is available at behave.readthedocs.io/en/latest/tutorial.html


# Lecture 55: Implement Parameterization to the Test Scenarios using Example outline Keywords

# Notes for Lecture 55
# What if we want to run any test with multiple data sets
# For example we may want to repeat the same test but with different data sets
  # To parameterize you test with multiple data sets we give the words Scenario Outline in BDD
  # If you don't mention Scenario parameterization will not happen here
  # Hover the cursor over the words Scenario Outline and it will say Create Example Section
  # After the Examples: section is created we can give the data sets that we need to run
  # To define the data sets we need to give the names of the colums (in this case isbn and aisle)
  # Then we have to give the values for each columns for isbn we gave fdfee,powr and for aisle we gave 8948,76333

  # How do we get these values into our addBookPayload in our step implementation file?
    # To achieve this we need do explicitly say isbn and aisle in our BDD steps and put them inside arrows like this (<isbn> and <aisle>)
    # This will allow Behave to match our words in BDD with the examples
    # Once python sees the arrows, it will come down to the examples and match the values in each column and execute them
    # For example once we get the line with <isbn> and <aisle>, python will see those words inside arrows, come down to the examples in Scenatrio Outline and match the <isbn> with examples in the isbn column
      # The same thing happens for <aisle>
    # It will send the values for isbn and aisle to our payLoad.py file which has a function that accepts the arguments isbn, aisle
    # Our stepimplementation.py file calls on our payLoad.py file which fill have isbn and aisle values already filled from our BBD features file
    # The same will happen for the next set of values in our examples





# Lecture 56: Use Tagging Mechanism to Run Selected Tests in Framework
# Let's say we have lots of tests written, and if we want to run a set of test cases
  # To run a set of test cases we can tag them appropriately in our features file (Ex: @smoke, @regression) - The name can be anything but the @ is needed
  # When we run the test cases in the terminal we would say behave, our directory with the file, --no-capture for logs, tags=
    # Example
      # behave features/BookAPI.feature --no-capture --tags=smoke
  # This will execute the tests tagged with the word smoke in our BDD feature file
  # If we say regression then the tests tagged with the word regression in our BDD file will run




# Lecture 57: Best Practices to Write Reusable Step Definitions Code for API Test Scenarios

# See BookAPI.feature file, github.feature and stepimplentation.py files for reference

# The And step is treated like the code for the step: Then Book is successfully added

  # If you use the And step, this will be treated as part of the Then step, becuase you are using conjunction with then

# Do we need two runner files one for hooks and one for step implementations or just one?


# If we want our status code to be 404, we don't have to write a new step definition
    # We can make our code generic:
    # In our stepimplementation file, instead of hard coding the status code, we can create a variable for it
    # For ex: our status code variable is called statusCode
    # Putting statusCode variable like this {statusCode} in our step definition file will be referenced to our actual status code in BDD test
    # We can reuse the status code anywhere
    # Therefore any BDD step with status code validation would be pointed to our code that checks our status codes

  # Qestion for Logesh or Sukanya:
  # Even though we reuse the code, do we have to change the steps in our then string in our step implementation
  # that is if the steps are written differently?


# We can reuse this code for any test checking for a status code since we made it generic, we may need to change the steps in the then tag (keep statusCode:d)
#@then('Verify status code of the response should be {statusCode:d}')
#def step_impl(context, statusCode):
#  print(context.response.status_code)
#  assert context.response.status_code == statusCode


# Lecture 58: Integrate Tagging and Hooks to build generalized BDD code for API automation

# If we ran the github.feature file scenario we will get an error - in this case a HOOK ERROR
# This is because the hook written can't find bookID (which was written for BookAPI.feature scenario) because
# the API for book is different than the API for github - our github test cases have nothing to do with BookAPI,
# and our after scenario (which is our hook) was written for the BookAPI not github test cases
# See hook code below - Refer to BookAPI.feature and github.feature for reference

    #def after_scenario(context, scenario):
    #    response_deleteBook = requests.delete('http://216.10.245.166/Library/DeleteBook.php', json={
    #       "ID": context.bookID
    #    }, headers={"Content-Type":"application/json"},
    #                                         )

    #    assert response_deleteBook.status_code == 200
    #    res_json = response_deleteBook.json()

    #    print(res_json["msg"])

# In reality even if we run our github.feature, we may be also running LibraryAPI scenarios.
# We will be adding a book and the hooks will also run as part of BookAPI.feature

# To avoid the Hook error we can tag the test cases that are associated with the hook - in BookAPI our tag is called @library
# In our environment.py file, we can write a conditional that will look for the tag
# Then anytime github.feature scenarios run, we can skip the hook and avoid a hook error and allow our hook to run only during our BookAPI.feature test cases

# To implement the solution, in our environment.py file we can write an if statement (conditional) to check for the tag.

#def after_scenario(context, scenario):
    #    if "library" in scenario.tags

    #    response_deleteBook = requests.delete('http://216.10.245.166/Library/DeleteBook.php', json={
    #       "ID": context.bookID
    #    }, headers={"Content-Type":"application/json"},
    #                                         )

    #    assert response_deleteBook.status_code == 200
    #    res_json = response_deleteBook.json()

    #    print(res_json["msg"])


# In the code snippet we see the word scenario in our after_scenario(context, scenario)
# Our scenarios from our .feature files are stored in the argument called scenario
# Why:
    # The reason our test case is stored in scenario is because after we run each scenario, then we move on to our hook
    # So all of the information scenario details are in our scenario argument

    # In our code we would write it as if "library" in scenario.tags
    # Here we are checking for library tags of the scenario
    # In our BookAPI.feature file we have written the tags as @library
    # Python will search for those tags before running the hook scenario in our environment.py file
    # Once the tag is found then our hook will run

# The reason for all this work is we need hooks only for adding a book (from BookAPI.feature) not github
# But when we have lots of test cases not every scenario will rely on adding a book, therefore giving scenario.tag
# will allow our tests to run

# Question for Sukanya: But how is the scenario argument storing our BDD test data

# Lecture 59: Generate Allure Reports for Python API BDD Framework

# Syntax to see allure reports
    # behave --no-capture -f allure_behave.formatter:AllureFormatter -o AllureReports

# Behave will all the features/scenarios in your feature folder
# The allure_behave.formatter:AllureFormatter -o AllureReports syntax gives us an allure report
# The -o creates a folder to store our results

# Once the test execution has completed, then our allure reports are generated and stored in the directory which we called AllureReports

# When the reports are generated, then we check the AllureReports folder/directory which was created and there we will see reports as JSON files
# To convert the JSON files to HML report we use the Allure package


"""
# Section 61: Parsing and Reading the CSV files using Pythin CSV Package
import csv

with open("utilities/loanapp.csv") as file: # We opened the file and saved it in a variable called csv_file using the as word
    csv_read = csv.reader(file, delimiter=",") # Using the reader method to read the contents of the csv_file
    print(csv_read)
    # Running the csv_read will give a reader object

    L = list(csv_read)
    print(L,"This is L")

    names = []
    status = []

    for row in L:
        names.append(row[0])
        status.append(row[1])

    print(names)
    print(status)
"""


"""
# Section 62: Building a Logic to get the Data from CSV Based on Conditional Query

import csv

with open("utilities/loanapp.csv") as file: # We opened the file and saved it in a variable called csv_file using the as word
    csv_read = csv.reader(file, delimiter=",") # Using the reader method to read the contents of the csv_file
    print(csv_read)
    # Running the csv_read will give a reader object

    L = list(csv_read)
    print(L)

    name_header = L[0][0]
    status_header = L[0][1]

    print(name_header)
    print(status_header)

    names = []
    status = []

    for row in L:
        names.append(row[0])
        status.append(row[1])

    print(names)
    print(status)

index = names.index('Sam') # This will give the index of the element name
loan_status = status[index]

print("Sam's loan status is" + loan_status)

# We used the index method to find the position of the element (called Sam) in the list called names
# We then saved that information in a variable called index

# To see what Sam's loan status was, we can take the position of the element (which turns of to be 2 and is saved in index variabe)
# Since status is a list, instead of putting 2 we can put the variable called index for our list called status
# Now we can see if Sam was approved or rejected

# Sam's position is number 2 in the list called names from this code index = names.index('Sam')
# Sam's status will therefore be rejected since in the status list position 2 is a rejection
# The elements in the name list correspond to the elements in the status list
"""


"""
# Section 63: Parsing and writing back to CSV files using Python CSV package
import csv

with open("utilities/loanapp.csv") as file: # We opened the file and saved it in a variable called csv_file using the as word
    csv_read = csv.reader(file, delimiter=",") # Using the reader method to read the contents of the csv_file
    print(csv_read)
    print(type(csv_read))
    # Running the csv_read will give a reader object

    L = list(csv_read)
    print(L)
    print("##########################################")

    names = []
    status = []

    for row in L:
        names.append(row[0])
        status.append(row[1])

    print(names)
    print(status)

index = names.index('Sam')  # This will give the index of the element name
loan_status = status[index]

print("Sam's loan status is " + loan_status)

print("###############################################")

with(open("utilities/loanapp.csv", "a")) as wFile:
    writer = csv.writer(wFile)
    writer.writerow(["James","Approved"])

# After running the code multiple times, even if the printed output is giving an extra list without anything inside of it. The date should be saved in the CSV file
"""

# Lecture 65: Setting up AWS Linux EC2 Instance for Solving the Project - No coding for this lecture

# Go to AWS console
# Hit Sign up/or crete an account
# Validate AWS management Console
# Select Services and choose EC2
# Validate EC2 dashboard
# Click Orange Launch Instance button - This has a VIRTUAL SERVER
# Choose Amazon Linux AMI 2018.03.0 (HVM) SSD Volume type - Make sure it works with your operating system
# Hit Select
# Choose the Default option and select the "Next: Configure Instance Details button"
# Leave the default network settings already filled in
# Hit Next: Add Storage
# Don't need to chance the default configurations
# Hit Next: Add Tags
# In the Tags page you can click Add Tag and give a name to server with a key and value pair
# In the video he gives the name as Key and the Value as Jenkins_CI_Server
# Hit Next Configure Security Group
# On the Security Group page hit add a rule and give the port range as 8080
# Hit Review and Launch
# Hit Create a Key Pair
# Give Key Pair name
# Hit Launch Instances - IMPORTANT INFORMATION TO KNOW SEE BELOW
# It will take a few minutes
# Select the link in the green box where it says your instances are now launching - it will be a combination of letters and numbers

# How to access the server
    # You need to make an SSH connection to Linux machine - you can use putty or MobaXterm
    # Open MobaXterm and select SSH
    # Give the remote host - This is the IP address of the Linux server
    # In the instance that was launched we will see the IP address of the Linux server - It is in the IPc4 Public IP section
    # Specify Username - default is ec2-user for all AWS Linux connections. Putting other names in the username will give an error
    # Select Advaced SSH settings - we need a pum file extention
    # On the Use Private Key section - upload your .pm key into your system - This lets you athenticate IP, that file path is basically your key that lets you unlock the machine
    # Click on OK
    # This will create a new window - Now you are in your Linux server



# Before Hitting Launch Instances

    # So here, for the first time, when you create any Linux or when when you create any other server, it will ask you to create one key pair pom file.
    # We call it as .pm.
    # This is a file which is used to authenticate.
    # So for the first time when you do this, you will not have key pair because I already have some servers in my AWS account.
    # I have my key pair, so you can actually create a new key pair.
    # Select this option and give one key pair name and you say download that key pair.
    # After that, any time when you want to come back and access this server again, it will ask you to upload key pair.
    # Okay, now you create one and download right next time when you want to access it or when you want to use that Linux server.
    # So you have to provide this key pair every time to authenticate yourself, right?
    # So make sure you provide one proper name and download it and make sure you save it securely in your system.
    # Again, to access that server again for next time you need this key pair.


# Lecture 66: Setting up SSH connection in AWS Linux Instances

# There are still some configurations left to connect your python code
# AWS will not enable password authentication - SSH
# We will make a SSH connection from python to the server
# We need to give the host - which is the IP adddress of the server so AWS can understand your username and password
# By default AWS will NOT allow anyone to login with just a password authentication - the default is set to off

# How to enable password authentication to SSH
    # We are currently logged in as a EC2 user, there are two users one is the root and the other EC2
    # To log back in as a root user, you give this command: sudo su -
    # You are now logged in as a root user
    # To enable password authentication open the SSD configuration file and make a change to enable password authentication
    # When it opens and select "i" button - this is the insert button
    # Scroll down to password authentication below the EC2 uses key for remote access
    # Right below password authentication will be set to no - we can delete no and type yes
    # Hit escape button and hit :wq to save - This is the save command
    # Reload the service since we made change with command service sshd reload

# Next we have to make a password for EC2 user
    # We already enabled password authentication - but we don't know the password
    # By default EC2 username is created for you when an instance is made but we need to give a password
    # We can't connect with root credentials
    # passwd ec2-user to create the password
    # Do it a second time and hit enter


"""
# Lecture 67: Install Paramiko Package to Establish Connection to Servers
# The code will be for show and for logic since we don't have AWS instance for server connection available
# Paramiko is a python library that helps connect remotely to another Linux server

import paramiko as paramiko
from utilities.configurations import *



username = getConfig()['Server']['username']
password = getConfig()['Server']['password']
host = getConfig()['Server']['host']
port = getConfig()['Server']['port']


ssh = paramiko.SSHClient() # First we tell our paramiko library that we need to make an SSH connection


ssh.set_missing_key_policy(paramiko.AutoAddPolicy()) # Here python will generate a default public key and add it here

# Now we can start the connection since we enabled the class method - wich is paramiko.SSHClient()
ssh.connect(host, port, username, password) # This needs IP address, port name, username, password
"""
