# write a method that takes an array as an argument and returns
# two arrays as a pair of nested arrays containing the first
# half and second half separately
# if there is an odd number, the middle element should be placed
# in the first half
# explicit
# one array split into two
# if odd elements, first half gets the extra
# empty arr  gets split to two arr


def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]