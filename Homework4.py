# Homework 4 Guessing Game
print("Welcome to the guessing game!!!")
import random
answer = random.randint(0,100)
attempts = 0
choices = []

while True:
    guess = int(input("Please enter a number from 0 to 100: "))
    choices.append(guess)
    attempts = attempts + 1
    if guess == answer:
        print(f"YOU WIN!!!. It took you {attempts} attempts")
        print(f"Here are your choices before reaching the correct answer {choices}")
        break
    elif guess > answer:
        print("Too High. Try Again")
    elif guess < answer:
        print("Too Low. Try Again")

