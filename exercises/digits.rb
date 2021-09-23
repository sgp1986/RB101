# write a method that takes one argument, a positive number, and returns a list of thw digits in the number

# P
# input  - positive integer
# output - list if integers (array)
# model  - take a number, split out each digit of the number, add these numbers to an array, print the array

# E
# puts digit_list(12345)
# puts digit_list(7)
# puts digit_list(375290)
# puts digit_list(444)

# D
# integers, array

# A
# digit_list(number)
# split number by digit
# add each digit to an array
# print array

# C
=begin
def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end
=end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

p digit_list(12345)
p digit_list(7)
p digit_list(375290)
p digit_list(444)