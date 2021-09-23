
# write a method that takes one argument, a string containing 
# one or more words, and returns the given string with words that
# contain 5 or more characters reversed

# P
# input  - a string of words
# output - the same string with words longer than 4 reversed
# model  - given a string of words, check the string for words longer
#         than 5 characters, reverse only those words, and print
#         the words in the same order in a string

# E
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# D
# strings, maybe an array for the words to check the lengths

# A
# given a string of words named string
# split the words up to individual words in an array named words
# find words >= 5 and reverse the order of the characters
# combine the words back to a string 
# print the new_string

# C

def reverse_words(string)
  words = []

  string.split.each do |word|
  word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS