# write a method that displays an 8 point star in an n x n grid
# n must be an odd integer that is supplied as an argument
# smallest start will be 7x7
# star will be n rows down and n spaces wide
# middle row is n * in a row
# row above and below middle is 3 * in a row, at center
# rows above and below those are 3 * with 1 space between
# then 2 spaces, 3 spaces, etc until n rows

def print_row(grid_size, distance_from_center)
  num_spaces = distance_from_center - 1
  spaces = ' ' * num_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end


def stars(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

stars(11)