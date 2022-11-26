# Asking the name
print("Hello, what is your name:", end = " ")
name = input()

# Asking how are you
print("How are you doing:", end = " ")
feeling = input()

# Asking where are your from
print("Where are you from:", end = " ")
city = input()

# Asking what your favorite time of the year is
print("What is your favorite time of the year:", end = " ")
time_of_year = input()

# Asking least favorite season
print("What is your least favorite season:", end = " ")
season = input()

# Asking to grab food
print("Do you want to grab food", end = " ")
response = input()


print("Hello, what is your name?", name.capitalize(),"\n", "How are you doing?", feeling.capitalize(),"\n", "Where are you from?",
      city.capitalize(),"\n",
      "What is your favorite time of the year?", time_of_year.capitalize(),"\n", "What is your least favorite season?", season.capitalize(),"\n",
      "Do you want to grab food?", response.capitalize(),"\n", "I think you meant", response.replace("no", "Yes"))
