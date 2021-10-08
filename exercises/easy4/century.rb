# write a method that takes a year as input and returns the century
# return value should be a string that begins with the century
# number, ending with st, nd, rd, th as appropriate
# centuries are from 01 - 00

# P
# take a given year, and find the century it is in from 01-00,
# printing out the century number as a string such as 1st, 2nd, etc

# E
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# D
# input numbers, return strings

# A
# casual ps
# take the given number ex 1986
# find what century it is in: 01-100 is 1st, 101-200 2nd, etc
#   1986 is in the 20th century
#   20th ends in th
# print out 20th
# more formal
# take given number 1986
# find the century
#   century number is (year - 1) / 100
#   century string is century number applying the suffix rule

# C
def century(year)
  century = (year / 100) + 1
  century -= 1 if year % 100 == 0
  p century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

century(2000)
century(2001)
century(1965)
century(256)
century(5)
century(10103)
century(1052)
century(1127)
century(11201)