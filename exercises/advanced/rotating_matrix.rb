# take a matrix (an array of arrays) and rotate it clockwise by
# 90 degrees. 

# square:
# 158    341
# 472 => 975
# 396    628

# nonsquare:
# 341    93
# 975 => 74
#        51
# LS ANSWER
# num_rows = matrix.size = array index = 3
# num_cols = matrix.first.size = matrix[0] elements idx = 3
# matrix = [
#   [1, 5, 8],
#   00,01,02
#   [4, 7, 2],
#   10,11,12
#   [3, 9, 6]
#   20,21,22
# ]

# rotated90_matrix = [
#   [3, 4, 1],
#   20,10,00
#   [9, 7, 5],
#   21,11,01
#   [6, 2, 8]
#   22,12,02
# ]

# rotated180_matrix = [
#   [6, 9, 3],
#   22,21,20
#   [2, 7, 4],
#   12,11,10
#   [8, 5, 1]
#   02,01,00
# ]

# rotated270_matrix = [
#   [8, 2, 6],
#   02,12,22
#   [5, 7, 9]
#   01,11,21
#   [1, 4, 3]
#   00,10,20
# ]

# matrix = [
#   [3, 4, 1],
#   00,01,02
#   [9, 7, 5]
#   10,11,12
# ]

# rotated_matrix = [
#   [9, 3],
#   10,00
#   [7, 4],
#   11,01
#   [5, 1]
#   12,02
# ]

# regardless of size/shape, the rotated matrix returns an array
# of all 0 index elements, followed by array of all 1 index 
# elements, followed by all 2 index elements, etc. 
# in reverse order (last original nested array index first)

# iterate through outer array (accessing each nested array)
  # iterate through nested array (accessing each element)
    # first iteration- store each element in its own array
    # second iteration- add to front of each new array, keeping
      # 0 idx with 0, 1 idx with 1, etc
    # continue through all arrays
# store all arrays in one array and return this array

# first iteration of matrix[0]
#  new_arr << [matrix[0][0]]
#  new_arr << [matrix[0][1]]
#  new_arr << [matrix[0][2]]
#             element idx is counter
# second iteration adding matrix[n][0] to matrix[0] arrays
#  new_arr[0].unshift(matrix[1][0])
#  new_arr[0].unshift(matrix[2][0])
#     new_arr idx is same as each arr element idx
#     matrix array idx is counter
# third iteration adding matrix[n][1] to matrix[0] arrays
#  new_arr[1].unshift(matrix[1][1])
#  new_arr[1].unshift(matrix[2][1])
#     new_arr idx increased 1, so did arr element idx
#     matrix array idx counts through iterations

def rotate90(matrix, rotations=1)
  new_matrix = create_new_arrays(matrix)
  m = add_arrays(new_matrix, matrix)

  rotations == 1 ? m : rotate90(m, rotations - 1)
end

def create_new_arrays(matrix)
  new_matrix = []
  counter = 0
  loop do
    new_matrix << [matrix[0][counter]]
    counter += 1
    break if counter == matrix[0].size
  end
  new_matrix
end

def add_arrays(new_matrix, matrix)
  0.upto(new_matrix.size - 1) do |element|
    1.upto(matrix.size - 1) do |array|
      new_matrix[element].unshift(matrix[array][element])
    end
  end
  new_matrix
end

# def rotate90(matrix)
#   result = []
#   number_of_rows = matrix.size
#   number_of_columns = matrix.first.size
#   (0...number_of_columns).each do |column_index|
#     new_row = (0...number_of_rows).map do |row_index|
#       matrix[row_index][column_index]
#     end
#     result << new_row.reverse
#   end
#   result
# end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1, 3)
new_matrix2 = rotate90(matrix2, 2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 #== [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 #== [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2