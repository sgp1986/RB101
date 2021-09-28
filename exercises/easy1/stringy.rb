# write a method that takes one argument, a positive integer, 
# and returns a string of alternating 1s and 0s, always starting 
# with 1. the length of the string should match the given integer

# P
# input  - positive integer
# output - string of 101010, length of the input integer
# model  - given an integer, print out a string of 1 and 0 based
#         on what number the integer is

# E
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# D
# integer for the input, string for the output

# A
# given an integer
# iterate over the 1 & 0 #{integer} number of times

# C

def stringy(size = 1)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(21)
puts stringy(1)
puts stringy