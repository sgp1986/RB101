# write a method that takes an array and a search value as two 
# arguments. this method should return true if the search value
# is in the array, and false if it is not


# take an array
# compare the search value to each element

def include?(array, search)
  array.any? do |element|
    element == search
  end
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false