require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

VALID_YES = ['yes', 'y']
VALID_NO = ['no', 'n']

def clear_screen
  system "clear"
end

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

def get_loan_amount
  prompt MESSAGES['loan']
  loan_amount = nil
  loop do
    loan_amount = gets.chomp
    break if number?(loan_amount)
    prompt MESSAGES['invalid'] + "amount."
  end
  loan_amount
end

def get_apr
  prompt MESSAGES['apr']
  apr = nil
  loop do
    apr = gets.chomp
    break if number?(apr) || apr == '0'
    prompt MESSAGES['invalid'] + "percentage."
  end
  apr
end

def get_duration
  prompt MESSAGES['duration']
  duration = nil
  loop do
    duration = gets.chomp
    break if number?(duration)
    prompt MESSAGES['invalid'] + "number of years."
  end
  duration
end

def get_down_payment
  prompt MESSAGES['down']
  down_payment = nil
  loop do
    down_payment = gets.chomp
    break if number?(down_payment) || down_payment == '0'
    prompt MESSAGES['invalid'] + "amount."
  end
  down_payment
end

def calc_monthly_payment(loan_amount, apr, down_payment, monthly_duration)
  annual_interest = apr.to_f / 100
  monthly_interest = annual_interest / 12
  monthly_payment = (loan_amount.to_f - down_payment.to_f) *
                    (monthly_interest.to_f / (1 -
                    (1 + monthly_interest.to_f)**(-monthly_duration)))
  monthly_payment
end

def display_results(loan_amount, down_payment, apr, monthly_duration, monthly_payment, total_payment)
  prompt <<-MNTHPYMNT
  Your loan details are:
  Your loan amount: $#{format('%.2f', loan_amount)}
  Your down payment: $#{format('%.2f', down_payment)}
  Your interest rate: #{format('%.2f', apr)}%
  Your duration in months: #{format('%.0f', monthly_duration)}
  Your monthly payment: $#{format('%.2f', monthly_payment)}
  Your total repayment: $#{format('%.2f', total_payment)}
  MNTHPYMNT
end

def yes?(input)
  VALID_YES.include?(input)
end

def no?(input)
  VALID_NO.include?(input)
end

def again?
  input = nil
  loop do
    input = gets.chomp.downcase
    break if yes?(input) || no?(input)
    prompt MESSAGES['invalid'] + "option."
  end
  input
end

clear_screen
prompt MESSAGES['welcome']

loop do
  loan_amount = get_loan_amount.to_f
  apr = get_apr.to_f
  duration = get_duration.to_f
  down_payment = get_down_payment.to_f
  monthly_duration = duration.to_f * 12

  if apr == 0
    monthly_payment = (loan_amount.to_f - down_payment.to_f) / monthly_duration
  else
    monthly_payment = calc_monthly_payment(loan_amount, apr,
                                           down_payment, monthly_duration)
  end

  total_payment = (monthly_payment.to_f * monthly_duration.to_i)

  display_results(loan_amount, down_payment, apr, monthly_duration, monthly_payment, total_payment)

  prompt MESSAGES['again']
  answer = again?
  break unless yes?(answer)
  clear_screen
end

prompt MESSAGES['bye']
