# create a tip calculator that asks for a bill amount and tip rate
# compute the tip and display the tip and total amount

# P
# input  - bill amount and tip percentage
# output - tip amount and total bill
# model  - ask the user for both the bill and the tip %, then
#       calculate the tip % from the bill, display the amount 
#       and the total including the tip

# E
# bill- 200, tip%- 15 = tip- $30 total- $230

# D
# floats

# A
# ask user for the bill amount
#   save as bill
# ask user for tip percentage
#   save as tip percent
# tip = bill * (tip percent / 100)
# total = bill + tip
# print the results

# C
puts "How much is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
tip_percent = gets.to_f

tip = bill * ( tip_percent / 100 )
total = bill + tip

puts "The tip is #{tip}"
puts "The total is #{total}"