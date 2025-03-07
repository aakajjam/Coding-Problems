# Black Jack
from random import seed
from random import randint
seed()
# Generate a random number

Give = randint(2,10)
H = input("Type hit")
Hit = int(H)
Hit = Hit + 0

if (Hit == 21):
    print (" WINNER ")

elif (Hit > 21):
    print (" You lose ")