# write a method that returns true if the string passed as an 
# argument is a palindrome, and false if its not
# cass, spaces, punctuation matter

# P
# take a given string, pass the string into an argument that will
# return true if the order of the characters match the reverse
# order

# E
# madam => true
# Madam = > false
# madam i'm adam => false
# 356653 => true

# D
# strings

# A
# given string
# pass string into method palindrome?
#   if the strings is equal to the reverse string
# return true

# C
def strg_palindrome?(string)
  string == string.reverse
end

def arr_palindrome?(array)
  array == array.reverse
end

def palindrome?(s_or_a)
  s_or_a == s_or_a.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end

p strg_palindrome?('madam')
p strg_palindrome?('Madam')
p strg_palindrome?("madam i'm adam")
p strg_palindrome?('356653')
p arr_palindrome?([1, 2, 2, 1])
p arr_palindrome?([1, 2, 2, 3])
p arr_palindrome?([1])
p palindrome?('madam')
p palindrome?('Madam')
p palindrome?([1, 2, 2, 1])
p palindrome?([1, 2, 2, 3])
p real_palindrome?('madam')
p real_palindrome?('Madam')
p real_palindrome?("madam i'm adam")
p real_palindrome?('356653')
p palindromic_number?(34543)
p palindromic_number?(123210)
p palindromic_number?(22)
p palindromic_number?(5)
p palindromic_number?(0121)