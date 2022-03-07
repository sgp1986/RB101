=begin
Implement a method that takes a hash list of users, and find the nexus:
the user whose rank is the closest is equal to his honor. Return the rank
of this user. For each user, the key is the rank and the value is the
honor.

If nobody has an exact rank/honor match, return the rank of the user who
comes closest. If there are several users who come closest, return the 
one with the lowest rank (numeric value). The hash will not necessarily
 contain consecutive rank numbers; return the best match from the ranks
 provided.

Example:
            rank    honor
users = {     1  =>  93,
             10  =>  55,
             15  =>  30,
             20  =>  19,    <--- nexus
             23  =>  11,
             30  =>   2 }


problem
  take a hash and find the user whose rank (key) is closest to their honor
  (value). 
  if there is an exact match return this users rank. if no match, 
  return the user rank that is closest. 
  if there are several, return the lowest rank of those

rules
  input - hash
  output - integer which is a hash key
  return exact or closest matching key to value
  if multiple ranks are similar, return lowest ranks

algorithm
  create an array of the hash pairs (hash.to_a)
  iterate through the array to access all inner arrays
  find smallest difference and return key
 
=end

def nexus(hash)
  ranks = hash.to_a
  ranks.each do |pair|
    return pair[0] if pair[0] == pair[1]
  end
  
  differences = ranks.map do |pair|
                  pair.max - pair.min
                end

  differences.each_with_index do |diff, idx|
    if diff == differences.min
      return ranks[idx][0]
    end
  end

end


# p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
# p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
# p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2
p nexus({2 => 2, 1 => 1}) == 1


def wave(str)
  results = []

  skip = 1
  str.chars.each_with_index do |char, idx|
    if char == ' '
      skip += 1
      next
    end
    if skip % 4 == 0
      results << str
    else
      results << str[0...idx] + char.upcase + str[idx+1..-1]
    end
    skip += 1
  end

  results
end

# p wave("hello") == ["Hello", "hEllo", "heLlo", "hello", "hellO"]
# p wave("studying") == ["Studying", "sTudying", "stUdying", "studying", "studYing", "studyIng", "studyiNg", "studyinG"]
# p wave("launch school") == ["Launch school", "lAunch school", "laUnch school", "launch school", "launCh school", "launcH school", "launch School", "launch school", "launch scHool", "launch schOol", "launch schoOl", "launch schooL"]
# p wave("") == []