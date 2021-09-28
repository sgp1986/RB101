# write a program that asks the user for an integer greater than
# 0, and asks if they want the sum or product of all numbers 
# between 1 and that number

# P
# input  - positive number, s or p
# output - the sum/product of all digits from 1 to that number
# model  - ask the user for a number and if they want a sum or 
#       product, then calculate based on the input and print

# E
# 5 s = 15
# 6 p = 720

# D
# integer, string

# A
# ask the user for a positive integer > 0
#   save as int
# ask if they want sum or product
#   save as calculation


# C
def compute_sum(num)
  total = 0
  1.upto(num) { |value| total += value }
  total
end

def compute_product(num)
  total = 1
  1.upto(num) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
calculation = gets.chomp

if calculation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif calculation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Not a valid input"
end