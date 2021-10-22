# write a method that will take a line of text and print it
# within a box
# explicit
# - input string
# - output string with box made up of +,-,| around it
# - input string will fit in terminal window
# implicit
# - box will the size of the string plus one space on each
#   side with the box character on each side
# - box will have a blank line above and below the string
# - + in corners, - for top and bottom line, | for sides
# - empty string will have an empty box 4char long and 5 tall

# given a string
# 1. find the length of the string
# 2. print the first line of the box
#     +- plus - for the length of the string plus   -+
# 3. print the second line of the box
#     | plus the length of the string in spaces plus |
# 4. print the third line of the box w/ the string
#     |             plus string plus                 |    
# 5. print the fourth line of the box
#     | plus the length of the string in spaces plus |
# 6. pring the last line of the box
#     +- plus - for the length of the string plus   -+

def print_in_box(string)
  horizontal_rule = "+#{'-' * (string.size + 2)}+"
  empty_line = "|#{' ' * (string.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_rule
end



print_in_box('To boldly go where no one has gone before.')
print_in_box('')