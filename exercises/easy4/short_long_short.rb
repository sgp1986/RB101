def short_long_short(str1, str2)
  str1.size < str2.size ? str1 + str2 +str1 : str2 + str1 + str2
end

p short_long_short('abc', 'defgh')
p short_long_short('abcde', 'fgh')
p short_long_short('', 'xyz') 