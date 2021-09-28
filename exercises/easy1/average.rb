# write a method that takes one argument, an array of integers, 
# and returns the average of all numberes in the array
# array will never be empty and will always have positive integers
# result should be an integer

# P
# input  - array of integers
# output - integer average of array elements
# model  - given an array of integers, add all elements together,
#         divide that by the number of elements, and print the result

# E
# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# D
# array of integers, printing result as integer

# A
# given an array of integers
# sum all elements together
# divide sum by array size
# print the result

# C

def average(arr)
  sum = arr.sum
  sum / arr.size
end


puts average([1, 6]) 
puts average([1, 5, 87, 45, 8, 8]) 
puts average([9, 47, 23, 95, 16, 52]) 