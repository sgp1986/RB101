# featured number: odd, multiple of 7, digits occur only once
# write a method that takes an integer as argument, and returns
# the next featured number greater than the argument
# return an error if there is no next featured number
# rules
# - number must be odd, multiple of 7, with unique digits
# - number is the first occurence larger than argument
# - if the argument is a featured number, return the next one
# steps
# 1. create list of featured numbers
#   - create empty array
#   - find multiples of 7
#   - find odd numbers of multiples
#   - find numbers with unique digits of odd multiples
# 2. select the first number greater than argument
#   - iterate through featured numbers until argument <
# 3. return selected number

# def featured_numbers(list, int)
#   multiples_7 = []
#   odd_multiples = []
#   unique_odd_multiples = []

#   sum = 7
#   loop do
#     multiples_7 << sum
#     sum += 7
      
#     multiples_7.each do |num|
#       odd_multiples << num if num.odd?
#     end

#     odd_multiples.each do |num|
#       if num.to_s.chars.size == num.to_s.chars.uniq.size
#         unique_odd_multiples << num
#       end
#     end

#     break if unique_odd_multiples.last > int
#   end
#   unique_odd_multiples.last
# end

# def featured(int)
#   numbers = []
#   featured_numbers(numbers, int)
# end

def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars  = number.to_s.chars
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

p featured(12)
p featured(20)
p featured(21)
p featured(997)
p featured(1029)
p featured(999_999)
p featured(999_999_987)