def swapcase(string)
  characters = string.chars.map do |char|
    if ('A'..'Z').include?(char)
      char.downcase
    elsif ('a'..'z').include?(char)
      char.upcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'