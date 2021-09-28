# build a program that asks users for the length and width of a
# room in meters and then displays the area of the room in both
# square meters and square feet

# P
# input  - length and width in meters
# output - square meters and square feet
# model  - ask the user for both the length and the width. times
#         those together to get the area in square meters. times
#         10.7639 to get the square feet. display both of those 
#         to the screen

# E
# L = 10, W = 7. sqm = 70 sqft = 753.47

# D
# integers

# A
# ask user for the length in meters
#   save as length
# ask user for the width in meters
#   save as width
# length * width = square meters
# square meters * 10.7639 = square feet
# print the sqm and sqft

# C
SQMETER_TO_SQFEET = 10.7639
puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

sqm = (length * width).round(2)
sqft = (sqm * SQMETER_TO_SQFEET).round(2)

puts "The area of the room is #{sqm} square meters (#{sqft} square feet)."