# write a method that takes two arrays as arguments and returns
# an array that contains all the values from the arguments
# there should be no duplication of values in the returned array
# explicit
# - two arrays merged into one
# - duplicate values are removed
# - no sub arrays

# take two arrays
# merge them into one new array
# flatten to one array
# remove duplicates
# return new array

def merge(arr1, arr2)
  # new_arr = []
  # new_arr << arr1
  # new_arr << arr2
  # p new_arr.flatten.uniq
  p arr1 | arr2
end

merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]