# write a method that takes one argument, a positive integer,
# and returns the sum of its digits

# P 
# input  - integer
# output - integer sum of input digits
# model  - given an integer, add the digits together and print 
#         out the sum

# E
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# D
# integers

# A 
# given an integer
# split the integer into digits
# sum those digits together
# print the sum

# C
 def sum(number)
  number.digits.sum
 end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

=begin
LS Solution
def sum(number)
  sum = 0
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

Solution 2
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

=end