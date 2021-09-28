# write a program that dispalys when the user will retire and
# how many years of work they have left

# P
# input  - current age, retirement age
# output - current year, retirement year, how many years left
# model  - take the users current age and when they want to retire
#         add them together, then add that to the current year.

# E
# age- 30, retire- 70, its 2021- retire in 2061, 40 years left

# D
# integers

# A
# ask user for their age
#   save as age
# ask user when they want to retire
#   save as retire age
# remaining = retire age - age
# retirement = current year + remaining
# display results

# C
puts "What is your current age?"
age = gets.to_i

puts "What age would you like to retire?"
retire_age = gets.to_i

remaining = retire_age - age
retirement = Time.now.year + remaining

puts "It is 2021. You will retire in #{retirement}."
puts "You only have #{remaining} years to go!"