# write a method that calculates and returns the index of the
# first fibonacci number that has the number of digits specified
# as an argument
# explicit
# -input integer for number of digits
# -output integer of index number
# -input wont be less than 2
# implicit
# -

# take the input integer of number of digits
# find the first number in the sequence to be that length
#   integer.to_s.length for number of digits
#   print the index number
  
def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

def find_fibonacci_index_by_length(digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.length >= digits

    first = second
    second = fibonacci
  end

  index
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847