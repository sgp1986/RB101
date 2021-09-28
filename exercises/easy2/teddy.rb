# build a program that randomly generates and prints teddy's age
# should generate a random number between 20 and 200

# P
# input  - random number between 20 and 200
# output - "teddy is __ years old!"
# model  - taking a random number from 20 to 200, insert that
#         into a string displaying teddy's age

# E
# Teddy is 69 years old!
# Teddy is 22 years old!

# D
# integer, string w/ interpolation

# A
# given age which = random number from 20 to 200
# print teddy is age years old

# C
age = rand(20..200)

puts "Teddy is #{age} years old!"