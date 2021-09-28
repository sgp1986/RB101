# write a method that takes one argument, a string, and returns a new string with the words in reverse order

# P
# input  - string
# output - new string in reverse order
# model  - take the given string, split the string by words, reorder the words in the reverse order in a new string, print the new string

# E
=begin
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
=end

# D
# string
# array for the split words? 

# A
# given a string
# split the string by spaces, save each word into array
# reverse the order of the words in the array
# convert back to a string
# print the new string

# C

def reverse_sentence(string)
  words = []
  words.push(string.split(" "))
  words.flatten.reverse.join(" ")
end

# Solution
# def reverse_sentence(string)
#   string.split.reverse.join(" ")
# end



p reverse_sentence('Hello World') == 'World Hello'
p reverse_sentence('Reverse these words') == 'words these Reverse'
p reverse_sentence('') == ''
p reverse_sentence('    ') == '' # Any number of spaces results in ''
