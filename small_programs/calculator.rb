require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')

# ask for two numbers
# ask for the operation to perform
# perform the operation on the two numbers
# print out the result

def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(input)
integer?(input) || float?(input)
end

def operation_to_message(op)
  case op
  when '1' then "Adding"
  when '2' then "Subtracting"
  when '3' then "Multiplying"
  when '4' then "Dividing"
  end
end

prompt MESSAGES['welcome']

loop do
  first_number = ''
  loop do
    prompt MESSAGES['first']
    first_number = gets.chomp

    if number?(first_number)
      break
    else
      prompt MESSAGES['invalid']
    end
  end

  second_number = ''
  loop do
    prompt MESSAGES['second']
    second_number = gets.chomp

    if number?(second_number)
      break
    else
      prompt MESSAGES['invalid']
    end
  end

    prompt MESSAGES['operator_prompt']

  operation = ''
  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt MESSAGES['not_op']
    end
  end

  prompt "#{operation_to_message(operation)} the two numbers..."

  result = case operation.to_i
           when 1 then first_number.to_f + second_number.to_f
           when 2 then first_number.to_f - second_number.to_f
           when 3 then first_number.to_f * second_number.to_f
           when 4 then first_number.to_f / second_number.to_f
           end

  prompt "Your result is #{result.to_f}"

  prompt MESSAGES['again']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt MESSAGES['bye']
