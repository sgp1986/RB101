# write a method that takes one integer argument, which may be positive, negative, zero
# the method should return true if the numbers absolute value is odd

def is_odd?(num)
  num % 2 > 0
end

puts is_odd?(5)
puts is_odd?(2)
puts is_odd?(0)
puts is_odd?(-17)