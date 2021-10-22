# write a method that takes a string argument and returns a 
# new string that contains the value of the original string
# with all consecutive duplicate characters collapsed into a
# single character
# explicit
# - input string
# - output new string
# - any amount of consecutive chars is reduced to 1
# implicit
# - empty string returns empty string
# - single char string returns the single char
# - repeated numbers are treated the same as a letter

# given a string
# 1. check the string for any consecutive characters
# 2. remove the characters except for one
# 3. save the string as a new string
# 4. return the string

# check the string for consecutive characters
# 1. iterate through each character in the string
# 2. identify if the character is the same as the previous
# 3. if so, remove any repeating characters
# 4. return the remaining characters


def crunch(string)
  counter = 0
  crunch_text = ''
  while counter <= string.size - 1
    crunch_text << string[counter] unless string[counter] == string[counter + 1]
    counter += 1
  end
  crunch_text
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''