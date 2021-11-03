def negative(num)
  # if num == 0
  #   0
  # elsif num > 0
  #   -num
  # else
  #   num
  # end

  num > 0 ? -num : num
end

p negative(5)
p negative(-3)
p negative(0)