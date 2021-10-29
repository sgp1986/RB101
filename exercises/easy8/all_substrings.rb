def substrings(string)
  substrings = []
  counter = 0
  loop do
    break if counter == string.size
    string.size.times do |idx|
      substrings << string[counter..idx]
    end
      counter += 1
  end
  substrings.reject { |e| e.empty? }
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]


p substrings('joyprice')