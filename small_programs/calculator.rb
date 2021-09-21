# ask for two numbers
# ask for the operation to perform
# perform the operation on the two numbers
# print out the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1' then "Adding"
  when '2' then "Subtracting"
  when '3' then "Multiplying"
  when '4' then "Dividing"
  end
end

prompt "Welcome to Calculator!"

loop do

  first_number = ''
  loop do
    prompt "Please enter the first number:"
    first_number = gets.chomp.to_f

    if valid_number?(first_number)
      break
    else
      prompt "Not a valid number."
    end
  end

  second_number = ''
  loop do
    prompt "Please enter the second number:"
    second_number = gets.chomp.to_f

    if valid_number?(second_number)
      break
    else
      prompt "Not a valid number."
    end
  end

  operator_prompt = <<-MSG
Which operation would you like to perform:
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt operator_prompt

  operation = ''
  loop do
    operation = gets.chomp
    
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt "please enter a valid operation"
    end

  end

  prompt "#{operation_to_message(operation)} the two numbers..."

  result = case operation.to_i
            when 1 then first_number + second_number
            when 2 then first_number - second_number
            when 3 then first_number * second_number
            when 4 then first_number / second_number
            else puts "That is not a valid option."
  end

  prompt "Your result is #{result}"

  prompt "Would you like to perform another calculation? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt "Thank you, goodbye!"
