# You are given an array which contains only integers (positive and 
# negative). Your job is to sum only the numbers that are the same and 
# consecutive. The result should be one array.

# You can asume there is never an empty array and there will always 
#be an integer.

# problem
  # take an array of integers and return an array with the integers that
  # are the same consecutively added up
# rules
  # input - array of integers
  # output - array of integers  
  # there will be no empty array
  # if there are not consecutive same integers, the one integer is added to return array
# algorithm
  # create results array
  # iterate through the input array
    # starting index = 0, ending index = starting index + 1
    # starting with the ending index at 1, see how many consecutive elements have the same value
    # once the ending index value does not match the starting index, sum the numbers up from starting index to ending index - 1
    # increase starting index to ending index, and ending index to starting index + 1
    # 

def sum_consecutives(array)
  results = []

  starting_index = 0
  ending_index = starting_index + 1
  loop do
    if ending_index == array.size - 1
      if array[ending_index] == array[starting_index]
        results << array[starting_index..ending_index].sum
        break
      else
        results << array[starting_index..ending_index - 1].sum
        results << array[ending_index]
        break
      end
    elsif array[ending_index] == array[starting_index]
      ending_index += 1
    else
      results << array[starting_index..ending_index - 1].sum
      starting_index = ending_index
    end
    break if starting_index == array.size - 1
  end
  results
end

def sum_consecutives(arr)
  results = []
  register = 0
  arr.each_with_index do |item, index|
    register += item
    next if item == arr[index + 1]
    results << register
    register = 0
  end
  results
end


p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]