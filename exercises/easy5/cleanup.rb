# take a string consisting of lowercase words and an assortment
# of non-alphabetic chars, write a method that returns that string
# with all non-alphabetic chars replaced by spaces. if they occur
# in a row, you should only have one space in the result
# explicit
# - all letters will be lowercase
# - any non letters are removed from the string and replaced with
#   a space
# - spaces in the resulting string should not be consecutive
# implicit
# - this includes apostrophes in contractions
# - this includes punctuation (question marks, periods)

# Data- strings
# Algorithm
# take the string
# identify non alphabetic characters
#   replace these with a space
# join the characters back together
# remove consecutive spaces
# return the string


def cleanup(string)
  clean = string.split('').map do |char|
    if ('a'..'z').include?(char)
      char
    else
      char = ' '
    end
  end
  clean.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '