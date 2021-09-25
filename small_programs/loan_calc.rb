require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

def prompt(string)
  puts ">> #{string}"
end

def float?(number)
  number.to_f.to_s == number && number.to_f > 0
end

def integer?(number)
  number.to_i.to_s == number && number.to_i > 0
end

def number?(input)
  integer?(input) || float?(input)
end

def get_input(input)
 
end


prompt MESSAGES['welcome']

loop do
  loan_amount = ''
  loop do
    prompt MESSAGES['loan']
    loan_amount = gets.chomp

    if number?(loan_amount)
      break
    else
      prompt MESSAGES['invalid'] + "amount."
    end
  end
  
  apr = ''
  loop do
    prompt MESSAGES['apr']
    apr = gets.chomp

    if number?(apr)
      break
    else
      prompt MESSAGES['invalid'] + "percentage."
    end
  end


  duration = ''
  loop do
    prompt MESSAGES['duration']
    duration = gets.chomp

    if number?(duration)
      break
    else
      prompt MESSAGES['invalid'] + "number."
    end
  end

  down_payment = ''
  loop do
    prompt MESSAGES['down']
    down_payment = gets.chomp

    if number?(down_payment)
      break
    else
      prompt MESSAGES['invalid'] + "number."
    end
  end

  monthly_duration = duration.to_f * 12

  if apr.to_i == 0
    monthly_payment = (loan_amount.to_f - down_payment.to_f) / monthly_duration
  else
    annual_interest = apr.to_f / 100
    monthly_interest = annual_interest / 12

    monthly_payment = (loan_amount.to_f - down_payment.to_f) *
                      (monthly_interest.to_f / (1 -
                      (1 + monthly_interest.to_f)**(-monthly_duration)))
  end

  prompt "Your monthly payment after a down payment of " \
         " $#{format('%.2f', down_payment)}," \
         " is $#{format('%.2f', monthly_payment)}" \
         " for #{format('%.0f', monthly_duration)} months. \n\n"

  total_payment = (monthly_payment.to_f * monthly_duration.to_i)

  prompt "Your total payment on your $#{format('%.2f', loan_amount)}" \
         " loan, after your down payment of $#{format('%.2f', down_payment)}," \
         " is $#{format('%.2f', total_payment)}. \n\n"

  prompt MESSAGES['again']
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt MESSAGES['bye']
