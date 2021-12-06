# transpose the nested arrays
# matrix     = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
#               00,01,02   10,11,12   20,21,22
# new_matrix = [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
#               00,10,20   01,11,21   02,12,22

# new_matrix = [
#   [matrix[0][0], matrix[1][0], matrix[2][0]],
#   [matrix[0][1], matrix[1][1], matrix[2][1]],
#   [matrix[0][2], matrix[1][2], matrix[2][2]],
# ]


def transpose(array)
  result = []
  number_rows = array.size
  number_cols = array.first.size
  (0...number_cols).each do |column_index|
    new_row = (0...number_rows).map { |row_index| array[row_index][column_index] }
    result << new_row
  end
  result
end

matrix = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

p transpose(matrix)

arr = [[1, 2, 3, 4]]
p transpose(arr)
p transpose([[1], [2], [3], [4]])
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])