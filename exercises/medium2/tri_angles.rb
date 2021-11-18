def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  sum = angles.reduce(:+)

  case
  when sum != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when ang1 > 90 || ang2 > 90 || ang3 > 90
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid