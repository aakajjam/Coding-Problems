# Part 1
#Number guessing game with functions

def getGuess():
    # Write a function that gets a guess from the user
    # This function should ensure that the user has entered a number.
    # If the input is not a valid number, keep trying until it is.
    # Convert the number to an integer and return it to the main program
    while True:
        guess = input("Enter a number: ")
        if guess.isdigit() is False: # The .isdigit() determines if the input is an integer number or not
            print("That is not a number")
        else:
            guess = int(guess)
            break
    return guess

def checkGuess(myGuess, secretNum):
    #Write a function that takes the guess and the secret Number
    #Check to see how close the numbers are to each other
    #and print that feedback to the user
    if myGuess == secretNum:
        print("YOU WIN")
    elif myGuess > secretNum:
        print("TOO HIGH")
    else:
        print("TOO LOW")

#Set the secret number
import random
secretNumber = random.randint(0,100)

#Initialize the guess and the list of guesses
guess = None
guessList = []

#Continue to input guesses until the guess is right
while guess != secretNumber:
    #input a guess
    guess = getGuess()
    guessList.append(guess)

    #check the geuss and give feedback to the user
    # Is the secret number parameter taking it from the secret = random.randint() - Ask the professor
    checkGuess(guess, secretNumber)

print("Good job, you guessed the secret number {}".format(guess))
print("You took {} guesses: {}".format(len(guessList), guessList))