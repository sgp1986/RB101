def leading_substrings(string)
  substrings = []
  string.size.times do |idx|
    substrings << string[0..idx]
  end
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']