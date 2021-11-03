def word_lengths(string)
  string.split.map do |word|
    "#{word} #{word.size}"
  end
end

p word_lengths("cow sheep chicken")
p word_lengths("baseball hot dogs and apple pie")
p word_lengths("It ain't easy, is it?")
p word_lengths("Supercalifragilisticexpialidocious")
p word_lengths("")