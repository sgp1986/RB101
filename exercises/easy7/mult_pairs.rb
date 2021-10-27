require 'pry'
# take two arrays
# mult arr1[0] times arr2[0], result into new array
# mult arr1[0] times arr2[1], result into new array
# mult arr1[0] times arr2[2], result into new array
# ... until arr2 ends
# mult arr1[1] times arr2[0], result into new array
# mult arr1[1] times arr2[1], result into new array
# mult arr1[1] times arr2[2], result into new array
# ... until arr2 ends
# ^^ until arr1 ends

def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |item_1|
    arr2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]