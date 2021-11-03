# write a method that returns a list of all substrings of a string that are
# palindromic. each substring must consist of the same sequence of letters
# forward and backwards. the return value should be arranged in the same 
# sequence that they appear in the string. duplicates should be included
# multiple times
# use the substrings from the previous exercise
# explicit
# -case does matter ('AsA' is palindrome, 'Asa' is not)
# -single characters are not palindromes
# implicit
# -return array of strings
# -if full word is palindrome, return full word first

# take given string
# break string into substrings
# create empty return array
# if substring 0..-1 == -1..0
#   move to empty array
# return empty array

def substrings(string)
  substrings = []
  counter = 0
  loop do
    break if counter == string.size
    string.size.times do |idx|
      substrings << string[counter..idx]
    end
      counter += 1
  end
  substrings.reject { |e| e.empty? }
end

def palindromes(string)
  all_substrings = substrings(string)
  results = []

  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

 p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
p palindromes('abcd') == []