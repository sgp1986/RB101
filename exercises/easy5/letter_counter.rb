# write a method that takes a string with one or more words
# separated by spaces and returns a hash that shows the 
# number of words of different sizes
# words consist of any string characters thats not a space
# explicit
# -input string
# -output hash
# -words are any character except space
# implicit
# -punctuation and apostrophes count as a char of the word
# -zero word strings return an empty hash

# D- string, hash, array?
# A
# take the given string
# separate the words by spaces into an array
# create an empty hash
# hash keys = the different word sizes in the array
# hash values = the number of words matching the letter size
# print the hash

# def word_sizes(string)
#   counts = {}
#   words = string.split(' ')
#   word_sizes = []
#   words.each do |word|
#     word_sizes << word.size
#   end
#   word_sizes.each { |num| counts[num] = word_sizes.count(num) }
#   p counts
# end

def word_sizes(string)
  counts = Hash.new(0)
  string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == {4=>1, 5=>1, 3=>1, 6=>1}
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

