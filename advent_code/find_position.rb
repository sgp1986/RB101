# calculate the horizontal position and depth position, and find
# the product of the two numbers for the result

# forward x increases horizontal position
# - no back/decreasing horiziontal position
# down x increases depth
# up x decreases depth



# take positions file, convert to array with each line as sub-array
# iterate through array, if the key matches movement key
#   add value to movement value
# once iteration is done, we will have the horizontal position
# subtract up from down to find depth position
# multiply the two and return the result

# add from array to hash
# access sub arrays with each
    # movements[sub_array[0]] += sub_array[1]

# PART 2
# down increases aim
# up decreases aim
# forward increases horizontal point AND increases depth
  # depth is forward x * aim

# track aim with every up and down
# every forward multiplies * aim to find current depth
# initialize depth and aim
# iterate through array
  # start with array[0]
    # array[0][0] is the movement
    # if down, add array[0][1] to aim
    # if up, subtract array[0][1] from aim
    # if forward, multiply array[0][1] with aim, add result to depth
  # move on to next subarray



# test case
# positions = [['forward', 5], ['down', 5], ['forward', 8],
#              ['up', 3], ['down', 8], ['forward', 2]]

def find_positions(array)
  horizontal = 0
  aim = 0
  depth = 0

  array.each do |move|
    case
    when move[0] == 'down'
      aim += move[1].to_i
    when move[0] == 'up'
      aim -= move[1].to_i
    when move[0] == 'forward'
      horizontal += move[1].to_i
      depth += aim * move[1].to_i
    end
  end

 horizontal * depth
end

positions = []
File.open('positions.txt') do |f|
  f.each_line do |line|
    positions << line.split
  end
end

p find_positions(positions)