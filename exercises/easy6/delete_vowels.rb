# write a method that takes an array of strings and returns an 
# array of the same string values with the vowels removed
# explicit
# -input - array of strings
# -output - array of strings
# implcit
# -strings without vowels left as is
# -strings that are all vowels return empty string

# D array of strings
# A
# given array of strings
# iterate through each string
#   iterate through each character in the string
#   if aeiou, remove
#   
#   else leave alone
# save as new array
# print new array

def remove_vowels(array)
  array.map { |string| string.delete('aeiouAEIOU') }
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']