# find the two entries that sum to 2020, multiply these two and 
# return the result

# take first number, find the sum of it + each other number
# if sum is 2020, break and save the two numbers
# else move on to next number and do the same

# need
# first number index
#   increases for starting number of each iteration
# iterate through array
#   add each number to starting number
#     if sum is 2020, multiply the two numbers and return result

def find_2020(arr)
  second_idx = 1
  

    
end

# test_case
#arr = [1721, 979, 366, 299, 675, 1456]

arr = []
File.open('expenses.txt') do |f|
  f.each_line do |line|
    arr << line.to_i
  end
end

p find_2020(arr)