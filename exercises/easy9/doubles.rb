def twice(num)
  str_num = num.to_s
  center = str_num.size / 2
  left_side = center.zero? ? '' : str_num[0..center - 1]
  right_side = str_num[center.. - 1]

  return num if left_side == right_side
  return num * 2
end

p twice(37)
p twice(44) 