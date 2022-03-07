# Find the length of the longest substring in the given string that 
# contains exatly 2 characters "a" and 2 characters "e" in it.

# As an example, if the input was “aaee”, the substring (aaee) 
#length would be 4.
# For a string "babanctekeaa", the longest substring is
# "babancteke" and its length is 10.

# If the length of the input string is 0, return value must be -1
# and if none of the substrings contain 2 "a" and "e" characters 
# return -1 as well.

# problem
  # take a string and find the longest substring that contains only two
  # instances of 'a' and two instances of 'e'
# rules
  # input - string
  # output - integer representing length of longest substring
  # if the input string is empty, or does not contain two a's and e's, return -1
  # the substring cannot contain more than 2 a's or e's
  # if the string only contains 2 a's and 2 e's, return the full string
# algorithm
  # find all substrings in the string
    # iterate through with starting index and ending index
  # select all strings with 2 a's and 2 e's 
    # if substring.count
  # find the longest substring
  # return the length

def longest_ae(string)
  substrings = []

  if string.count('a') < 2 || string.count('e') < 2
    return -1
  end

  (0...string.size).each do |starting_index|
    (starting_index...string.size).each do |ending_index|
      substrings << string[starting_index..ending_index]
    end
  end

  substrings = substrings.select do |substring|
    substring.count('a') == 2 && substring.count('e') == 2
  end

  longest = 0
  substrings.each do |substring|
    longest = substring.size if substring.size > longest
  end

  longest
end

p longest_ae("aaee") == 4
p longest_ae("babanctekeaa") == 10
p longest_ae("xenoglossophobia") == -1
p longest_ae("pteromerhanophobia") == 18
p longest_ae("johannisberger") == -1
p longest_ae("secaundogenituareabb") == 16
p longest_ae("aaaa") == -1