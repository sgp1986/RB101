def xor?(a, b)
  !!(a && !b) || (!a && b)
end

xor?(5.even?, 4.even?)
  
# !! forces the return value to be a boolean