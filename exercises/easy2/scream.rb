# write a program that asks for the users name, and greet the user
# if the user adds a ! to their name, the computer yells back

# P
# input  - name
# output - greeting, all caps if name!
# model  - ask the user for their name. if normal greet them, if
#       it ends in ! then greet with all caps

# E
# what is your name? bob, hi bob
# what is your name? bob! HI BOB WHY ARE WE SCREAMING

# D
# strings

# A 
# ask user for their name
#   save as name
# if name ends with !
#   greet bob in all caps
# otherwise
#   greet bob normally

# C
print "What is your name? "
name = gets.chomp

if name.end_with?('!')
  puts "HI #{name.chop.upcase}, WHY ARE WE SCREAMING?!"
else
  puts " Hi #{name}."
end