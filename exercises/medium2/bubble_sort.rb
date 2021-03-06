# write a method that takes an array as an argument, sorts the 
# array using bubble sort algorithm, mutatuing the argument, and
# returning the original array now sorted
# bubble sort: iterates through the array n times, swapping a and b
# as it goes through the elements. it continues until it passes
# through making no swaps
# rules
# - for each iteration, for each consecutive pair of elements,
#     if a > b, swap, else move on
# - if no swaps were made, end interating

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array