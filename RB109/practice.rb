=begin
# Write a method that takes two numbers. Return an array containing all primes between the two numbers (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.


input - two integers
output - array of integers that are prime numbers between the two input
problem
take two numbers, find all prime numbers between them and including them, return an array of primes
rules
no primes returns empty array
return all prime numbers in order

steps
create the return array
find all prime numbers starting at first input and ending at the last input
prime - not divided by any number except 1 and itself
go through every number from 2 to 1 less than the number, and if any go in equally then its not prime
prime helper method
  (2...num).each do |n|
    num % n != 0

=end

#(2...current_num).all? { |num| current_num % num != 0 }

def find_primes(start, finish)
  results = []
  
  for num in (start..finish)
    results << num if prime(num)
  end
  results  
end

def prime(num)
  if num == 1
    false
  else
  (2...num).all? { |n| num % n != 0 }
  end
end

# p find_primes(3, 10) == [3, 5, 7]
# p find_primes(11, 20) == [11, 13, 17, 19]
# p find_primes(100, 101) == [101]
# p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

# p prime(5)
# p prime(9)

# p ----------------------------


#Select the element out of the array if its index is a fibonacci number.
=begin
problem
test each element to see if it is a fibonacci number, if so then select that element 
input
array
output
array of selected elements
rules
fib number is the sum of the two numbers before it ( 2 is 1 and 1, 3 is 2 and 1, 5 is 3 and 2)

steps
create the helper method to determine a fib number
iterate through input array using each with index, determine if index is a fib number, and select the el if true

112358

fib(5)
(3 -1) +  (3-2)
2-1 + 2-2  +   1-1 + 1-2
1-1 + 1-2 + 0 

fib array = [1, 1, 2, 3, 5, 8 ...input array size-1]
starting with 1, add number to the number before it
fib = [1,1]
until fib.size == input array size
fib << fib[-1] + fib[-2]

=end

# def fib_index_select(array)
#   results = []
#   array.each_with_index do |el, idx|
#       results << el if create_fib(array.size).include?(idx)
#   end
#   results
# end

# def create_fib(num)
#   fib = [0, 1]
  
#   until fib.size == num
#     fib << fib[-1] + fib[-2]
#   end
#   fib
# end


# p fib_index_select([1, 2, 3, 4, 5, 6]) 
# p fib_index_select(('a'..'z').to_a) 

# p create_fib(10)

