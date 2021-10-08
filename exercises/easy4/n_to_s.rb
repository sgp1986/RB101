# P
# now write a method that turns a number to a string
# positive integer or zero
# no standard convention

# E

# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# D 
# number input, string output

# A
# given a number
# separate the digits
# translate the digit to a string character counterpart
# combine the string characters
# print the result

# C
DIGITS = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end


p integer_to_string(1234)
p integer_to_string(0)
p integer_to_string(5000)
p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)