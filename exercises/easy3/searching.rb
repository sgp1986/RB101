# write a program that solicits 6 numbers from the user, then
# prints a message that describes whether or not the 6th number
# appears amongst the first 5 numbers

# P
# input  - ask the user to input 6 numbers
# output - message saying if the 6th numbers matches any of the
#         first 5
# model  - ask the user to input a number x6, collect the first 5
#       numbers in a collection. take the 6th number and go through
#       the collection to find a match. output a message saying
#       if there is a match found in the collection

# E
# 25, 15, 20, 17, 23, 17 - the number 17 appears in []
# 25, 15, 29, 17, 23, 18 - the number 18 does not appear in []

# D
# integers for the input, array for collection, output a string

# A
# ask the user for a number
#   save that number in an array
# 5 more times
# 6th number, iterate through the array to find a match
# if there is a match, print the number appears in the collection
# if not, print that it does not appear in the collection

# C
numbers = []

puts "Enter the 1st number:"
numbers.push(gets.to_i)
puts "Enter the 2nd number:"
numbers.push(gets.to_i)
puts "Enter the 3rd number:"
numbers.push(gets.to_i)
puts "Enter the 4th number:"
numbers.push(gets.to_i)
puts "Enter the 5th number:"
numbers.push(gets.to_i)

puts "Enter the last number:"
search = gets.to_i

if numbers.include?(search)
  puts "The number #{search} appears in #{numbers}."
else
  puts "The number #{search} does not appear in #{numbers}."
end

