# ask for two numbers
# ask for the operation to perform
# perform the operation on the two numbers
# print out the result

puts "Welcome to Calculator!"

puts "Please enter the first number:"
first_number = gets.chomp.to_f

puts "Please enter the second number:"
second_number = gets.chomp.to_f

puts "Which operation would you like to perform:"
puts "1) Add"
puts "2) Subtract"
puts "3) Multiply"
puts "4) Divide"

operation = gets.chomp.to_i

case operation
when 1 then result = first_number + second_number
when 2 then result = first_number - second_number
when 3 then result = first_number * second_number
when 4 then result = first_number / second_number
else puts "That is not a valid option."
end

puts "Your result is #{result}"
