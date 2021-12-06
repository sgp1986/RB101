# take two sorted arrays, and build a new array element by element
# to return a new sorted array
# cannot mutate input arrays
# one empty array returns array with elements from other array
# arrays do not need to be same size

# input is two sorted integers
# initialize results array
# take the first element of each and compare them
# lowest number is stored in results array
# move on to next number in the array the element was chosen
# compare with the element from other array
# lowest number is stored in results array
# continue until both arrays are empty
# return the results array

# compare first elements

def merge(arr1, arr2)
  results = []
  arr1_idx = 0
  arr2_idx = 0
  loop do
    case
    when arr1[arr1_idx] == nil
      results << arr2[arr2_idx]
      arr2_idx += 1
    when arr2[arr2_idx] == nil
      results << arr1[arr1_idx]
      arr1_idx += 1
    when arr1[arr1_idx] >= arr2[arr2_idx]
      results << arr2[arr2_idx]
      arr2_idx += 1
    else
      results << arr1[arr1_idx]
      arr1_idx += 1
    end
    break if results.size == (arr1.size + arr2.size)
end
  results
end

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]
# p merge([1, 2, 5, 7, 8], [1, 1, 3, 4, 5, 7, 9])

def merge_sort(array)
  return array if array.size == 1
  
  halfway = array.size / 2
  sub_arr1 = array[0...halfway]
  sub_arr2 = array[halfway...array.size]

  sub_arr1 = merge_sort(sub_arr1)
  sub_arr2 = merge_sort(sub_arr2)

  merge(sub_arr1, sub_arr2)
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]