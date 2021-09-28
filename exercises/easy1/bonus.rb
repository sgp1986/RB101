# write a method that takes two arguments, a positive integer and
# a boolean, and calculates the bonus for a given salary. if the
# boolean is true, the bonus should be half the salary, if false,
# it should be 0

# P
# input  - an integer and a boolean
# output - an integer
# model  - given an integer and a boolean, return half of the
#        integer if the boolean is true, and 0 if its false

# E
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# D
# integer and boolean

# A
# given an integer and boolean
# if the boolean is true, divide the integer in half
# if false, 0
# print the result

# C

def calculate_bonus(sal, boo)
  boo ? (sal / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000