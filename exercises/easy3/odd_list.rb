# write a method that returns an array of every other element of
# an array passed in as an argument

# P
# take a given array, pass it into a method that will return every
# other element

# E
# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

# D
# arrays

# A
# given array
# pass array into oddities
#   iterate over each element
#     take every other element and pass them to a new array
# print the new array

# C
def oddities(array)
  array.select.with_index { |_, i| i % 2 == 0 }
  # odd_elements = []
  # index = 0
  # while index < array.size
  #   odd_elements << array[index]
  #   index += 2
  # end
  # odd_elements
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def', 'ghi'])
p oddities([123])
p oddities([])