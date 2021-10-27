# write a method that takes a string and returns a hash containing
# the number of uppercase, lowercase, and neither (number, space)


# take a string
# create hash of up/low/no case
# count the characters that are each case

def letter_case_count(string)
  counts = { lowercase: 0,
             uppercase: 0,
             neither: 0
  }

  string.chars do |char|
    if ('a'..'z').include?(char)
      counts[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end
  counts
end



p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }