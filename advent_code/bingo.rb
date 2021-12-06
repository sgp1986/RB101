# Problem
  # given the order of called numbers, find the bingo board that will win first.
  # then find the sum all unmarked numbers of that board. multiply the sum * last
  # called number to get the final score
# rules
  # each board is a 5x5 grid of numbers
    # array of 5 nested arrays, with 5 integer elements each
  # numbers are chosen at random (list of numbers to be called below)
  # chosen numbers are marked as called if they appear on the board
    # called number may not appear on all boards
    # QUESTION - how to mark called numbers?
      # switch integer to_s to mark with quotes?
      # check if any nested array contains all strings
      # check if all nested arrays index X contain all strings
  # board wins by marking 5 numbers in a row or column 
    # no diagonals

# steps
  # create board
  # check rows and columns for called out numbers
  # mark the called out numbers
  # check for winning rows/columns
  # once winner is found
    # sum unmarked numbers
    # multiply sum times last called number
    # return result

# create boards from txt input
# get data using File.open
  # removing empty lines
# find out how many boards you have
# first board is lines 0..4, second is 5..9, etc

boards = []

def initialize_board(boards)
  lines = []
  
  File.open('bingo.txt') do |f|
    f.each_line do |line|
      if !line.split.empty?
        lines << line.split.map { |num| num.to_i }
      end
    end
  end

  breakpoint = lines.size / 5  

  loop do
    boards << lines.pop(5)
    
    break if boards.size == breakpoint
  end
  boards
end
# the result of the above (visualization)
# [
#   [
#     ["14", "21", "17", "24", "4"],
#     ["10", "16", "15", "9", "19"],
#     ["18", "8", "23", "26", "20"],
#     ["22", "11", "13", "6", "5"],
#     ["2", "0", "12", "3", "7"]
#   ],
#   [
#     ["3", "15", "0", "2", "22"], 
#     ["9", "18", "13", "17", "5"], 
#     ["19", "8", "7", "25", "23"], 
#     ["20", "11", "10", "24", "4"], 
#     ["14", "21", "16", "12", "6"]
#   ], 
#   [
#     ["22", "13", "17", "11", "0"], 
#     ["8", "2", "23", "4", "24"], 
#     ["21", "9", "14", "16", "7"], 
#     ["6", "10", "3", "18", "5"], 
#     ["1", "12", "20", "15", "19"]
#   ]
# ]

# check rows for strings (marked/called numbers)
# 3.0.0 :002 > y = [1, 'a', 'b']
#  => [1, "a", "b"] 
# 3.0.0 :003 > z = ['a', 'b', 'c']
#  => ["a", "b", "c"] 
#  3.0.0 :006 > z.select { |el| el.is_a?(String) }.size == z.size
#  => true 
# 3.0.0 :007 > y.select { |el| el.is_a?(String) }.size == y.size
#  => false 

# check columns for strings (marked/called numbers)
# 3.0.0 :008 > a = [['a', 1], ['b', 'c']]
#  => [["a", 1], ["b", "c"]] 
#  3.0.0 :010 > a.map { |row| row[0].is_a?(String) }
#  => [true, true] 
# 3.0.0 :011 > a.map { |row| row[1].is_a?(String) }
#  => [false, true] 
# 3.0.0 :012 > a.map { |row| row[1].is_a?(String) }.all?
#  => false 

# iterate through ORDER, mark off any board numbers that match |calling|
  # order[0] = 7
  # iterate through boards to access each board of 5 rows |board|
    # iterate through each board to access each row of 5 numbers |row|
      # iterate through each row to access each number |number|
        # check if the number matches the called number

# test order
# ORDER = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]

ORDER = [31,50,79,59,39,53,58,95,92,55,40,97,81,22,69,26,6,23,3,29,83,48,18,75,47,49,62,45,35,34,1,88,54,16,56,77,28,94,52,15,0,87,93,90,60,67,68,85,80,51,20,96,61,66,63,91,8,99,70,13,71,17,7,38,44,43,5,25,72,2,57,33,82,78,89,21,30,11,73,84,4,46,14,19,12,10,42,32,64,98,9,74,86,27,24,65,37,41,76,36]

initialize_board(boards)

# METHOD DEFINITIONS
def winning_row?(boards)
  boards.map do |board|
    board.any? do |row|
      row.select do |num|
        num.is_a?(String)
      end.size == row.size
    end
  end.include?(true)
end

def winning_col?(boards)
  results = nil
  idx = 0

  loop do 
    results = boards.map do |board|
      board.all? do |row|
        row[idx].is_a?(String)
      end
    end
    
    if results.include?(true)
      break
    else
      idx += 1
    end
    break if idx == 6
  end
  results.include?(true)
end

def row_that_won(boards)
  boards.select do |board|
    board.any? do |row|
      row.all? do |num|
        num.is_a?(String)
      end
    end
  end.flatten
end

def col_that_won(boards)
  results = []
  idx = 0

  loop do 
    results << boards.select do |board|
      board.all? do |row|
        row[idx].is_a?(String)
      end
    end
    
    if results.include?(true)
      break
    else
      idx += 1
    end
    break if idx == 6
  end
  results.select do |row|
    !row.empty?
  end.flatten
end

def find_sum(boards)
  sum = 0
  boards.each do |num|
    sum += num if num.is_a?(Integer)
  end
  sum
end

# # test case
# boards = [
#   [
#     [14, 18, 14, 5, 4],
#     [7, 16, 21, 9, 19],
#     [5, 8, 17, 26, 20],
#     [12, 11, 24, 6, 5],
#     [3, 0, 4, 3, 7]
#   ]
# ]

# METHOD TESTS
# p check_rows(test)
# p check_cols(test)

index = 0
loop do
  boards = boards.map do |board|
    board.map do |row|
      row.map do |num|
        if num == ORDER[index]
          num.to_s
        else
          num
        end
      end
    end
  end
  
  if winning_row?(boards)
    puts "winning row " + ORDER[index].to_s
    p row_that_won(boards)
    sum = find_sum(row_that_won(boards))
    p sum * ORDER[index]
    break
  elsif winning_col?(boards) 
    puts "winning column " + ORDER[index].to_s
    p col_that_won(boards)
    sum = find_sum(col_that_won(boards))
    p sum + ORDER[index]
    break
  elsif index == ORDER.size
    puts "end of line"
    break
  end
  index += 1
end
