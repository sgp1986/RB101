# take a sentence string input and return the same string with 
# any numbers as integers

NUMBERS = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9',
  'zero' => '0'
}

def word_to_digit(sentence)
  NUMBERS.keys.each do |word|
    sentence.gsub!(/\b#{word}\b/, NUMBERS[word])
  end
  sentence.gsub(/(\d)\s/, '\1')
  
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
