def sequence(count, multiple)
  # (1..count).map { |value| value * multiple }
  arr = []
  current_num = multiple

  count.times do
    arr << current_num
    current_num += multiple
  end
  arr
end

p sequence(5, 1)
p sequence(4, -7)
p sequence(3, 0)
p sequence(0, 1000000)