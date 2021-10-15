require 'pry'
# take a string of words separated by spaces, and write a method
# that takes this string and returns a string where the first 
# and last letter of every word are swapped
# explicit
# -every word contains at least one letter
# -every string will always contain at least one word
# -strings will contain nothing but words and spaces
# implicit
# -capitalized letters will stay capitalized
# -1 char strings will return the same char in new string
# -2 letter words will swap/be backwards

# E
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# D
# strings, arrays?

# A
# take the given string
# split the string by spaces
# copy elements first element, copy elements last element
# first = last, last = first
# repeat to other elements til the end of the array
# join the words back together with spaces

def swap_first_last_chars(word)
  word[0], word [-1] = word[-1], word [0]
  word
end

def swap(string)
  words = string.split.map do |word| 
    swap_first_last_chars(word)
  end
  words.join(' ')
end

p swap('the')
p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a')

# ORIGINAL LOOP
# counter = 0

# loop do
#   break if counter == words.size
#   first_char = words[counter][0]
#   last_char = words[counter][-1]
#   words[counter][0] = last_char
#   words[counter][-1] = first_char
#   counter += 1
# end