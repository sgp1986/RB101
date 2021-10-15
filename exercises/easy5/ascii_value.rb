#P
# write out a method that determines and returns the ASCII string
# value of a string passed in as an argument
# ASCII string value is the sum of the ASCII values of every 
# character in the string
# String#ord can determine the ASCII value of a character

def ascii_value(string)
  chars = string.split('')
  counter = 0
  letter_score = 0

  loop do
    break if counter == chars.size
    current_letter = chars[counter]
    letter_score += current_letter.ord
    
    counter += 1
  end
  letter_score
end

p ascii_value('Four score')
p ascii_value('Launch School')
p ascii_value('a')
p ascii_value('')

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end