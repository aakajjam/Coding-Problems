# This file is for the Udemy Course: The Modern Python 3 Bootcamp

# Lecture 112: List Comprehension

# [(some varable name with an expression - for example multiplication ) for (item) in (iterable - like a list ) (if condition - This part is optional)] - This is the syntax for list comprehension, T
# Example
nums = [1,2,3]

# We take an existing list and then output another list with different values based upon the first list
print([x * 10 for x in nums])
print([x / 2 for x in nums])

numbers = [1,2,3,4,5]

doubled_numbers = [num * 2 for num in numbers] # We gave a variable name (num) with an expression (*2), then iterate num with for loop in our iterable (numbers)
print(doubled_numbers) # This is just a cleaner way to write compared to the many lines of a for loop

name = "Colt"
uppercase_name = [char.upper() for char in name]
print(uppercase_name)

friends = ["ashley", "matt", "michael"]
print([friend[0].upper() for friend in friends])

print([num * 10 for num in range(1,6)]) # Basically we did the code that normally goes under the for loop in the same line that we defined our for loop

print([bool(val) for val in [0, [], '']]) # This iterates over the list defined with random values and returns a new list telling if its True or False

colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
print([color.upper() for color in colors])

nums = [4,5,6]
print([str(num) + "HELLO" for num in nums])





# In essence for list comprehensions we do our for loop normally, but instead of putting the expression in the next line, we place on the same line as the for loop
# We also generate a new list