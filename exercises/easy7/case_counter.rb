# write a method that takes a string and returns a hash containing
# the number of uppercase, lowercase, and neither (number, space)


# take a string
# create hash of up/low/no case
# count the characters that are each case

def letter_case_count(string)
  counts = {}
  percentages = {}
  chars = string.chars
  length = string.length

  counts[:lowercase] = chars.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = chars.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = chars.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:lowercase] = ((counts[:lowercase] / length.to_f) * 100).round(2)
  percentages[:uppercase] = ((counts[:uppercase] / length.to_f) * 100).round(2)
  percentages[:neither] = ((counts[:neither] / length.to_f) * 100).round(2)
end

p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('abcdefGHI') #== { lowercase: 0, uppercase: 0, neither: 0 }