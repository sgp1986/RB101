# write a method that returns true if a word passed as an argument
# can be spelled from this set of blocks
# rules
# 13 blocks, 2 letters each
# can only spell words using one letter or the other
# input is case insensitive


def block_word?(word)
blocks = [
  ['B', 'O'],
  ['X', 'K'],
  ['D', 'Q'],
  ['C', 'P'],
  ['N', 'A'],
  ['G', 'T'],
  ['R', 'E'],
  ['F', 'S'],
  ['J', 'W'],
  ['H', 'U'],
  ['V', 'I'],
  ['L', 'Y'],
  ['Z', 'M']
]

  matches = blocks.map do |block|
    (word.include?(block[0]) && word.include?(block[1]))
  end
  !matches.include?(true)
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?("NOPE")
p block_word?("Nope")