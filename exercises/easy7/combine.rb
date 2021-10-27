# write a method that combines two arrays passed in as arguments
# with elements being taken in alteration
# both input arrays are non-empty and have the same number of 
# elements

# take two arrays
# combine them to one array
# new_array == arr1[0], arr2[0], arr1[1], arr2[1] ...


# def interleave(arr1, arr2)
#   new_arr = []
#   arr1.each_with_index do |ele, idx|
#     new_arr << ele << arr2[idx]
#   end
#   new_arr
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']

a = [1, 2, 3]
b = ['a', 'b', 'c']

p a.zip(b).flatten