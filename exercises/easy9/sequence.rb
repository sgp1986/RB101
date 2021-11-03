def sequence(num)
  num > 0 ? (1..num).to_a : (num..1).to_a.reverse
end

p sequence(5)
p sequence(3)
p sequence(1)
p sequence(-5)