# Guessing Game

from random import seed
from random import randint
seed()
# Generated a random number
Secret = randint(0,100) # Random integer generated is stored in a variable called Secret
print (Secret)

# Ask user to input a guess
Guess = int (input ("Guess a number "))
print (Guess)

# Keep on asking to guess a number until guess is correct
while (Guess != Secret):
    print("Try again")
    Guess = input ("Guess a number ")


# Once guess is correct tell user "Thank you for playing"
if (Guess == Secret):
    print("Thank you for playing")


