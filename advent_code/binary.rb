require 'pry'
# use the binary numbers in the diagnostics report to generate two
# new binary numbers - the gamma rate and epsilon rate. convert
# these to their decimal value. multiplythese together and return
# the result
# - gamma rate: the most common bit in the corresponding position
#   of all numbers. ex, index 0 of all numbers, most are 1, gamma is 1
# - epsilon is the opposite of the gamma, the least common bit

# steps
# initialize array and assign it to the diagnostics.txt data
# initialize variables gamma and epsilon, assign both to empty strings
# intiialize counter variable called index and assign it to 0
# iterate through each binary number in the array (strings)
  # test all index 0's from each binary string
  # result of test to show if there are more 0s or 1s
  # the most common char (0 or 1) is << appended to gamma
  # the least common char (0 or 1) is << appended to epsilon
  # test options
    # count all 0's at idx 0. if > half of array size, gamma = 0, else gamma = 1
  # how to check all 0's
    # array.each do |binary|
      # if binary[index] == 0
      #   zeros += 1
      # else
      #   ones += 1
      # end
      # idx += 1
      # zeros > ones ? gammas[index] = 0 : gammas[index] = 1
      # zeros = 0
      # ones = 0
    # end

# def power_consumption(array)
#   gamma = ''
#   epsilon = ''

#   find_rates(array, gamma, epsilon)

#   gam_decimal = binary_to_decimal(gamma)
#   ep_decimal  = binary_to_decimal(epsilon)

#   gam_decimal * ep_decimal
# end


# def find_rates(array, gamma, epsilon)
#   index = 0

#   loop do
#     zeros = 0
#     ones = 0

#     array.each do |binary|
#       if binary[index] == '0'
#         zeros += 1
#       else
#         ones += 1
#       end
#     end

#     if zeros > ones
#       gamma[index] = '0'
#       epsilon[index] = '1'
#     else
#       gamma[index] = '1'
#       epsilon[index] = '0'
#     end
#     index += 1
#     break if index == array[0].size
#   end
# end

# def binary_to_decimal(binary)
#   binary.reverse.chars.map.with_index do |digit, index|
#     digit.to_i * 2**index
#   end.sum
# end

# test case
# array = %w(00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010)

# array = []
# File.open('diagnostics.txt') do |f|
#   f.each_line do |line|
#     array << line.chomp
#   end
# end

# p power_consumption(array)

   # PART 2
# life support rating
# find the oxygen generator rating 
# find the CO2 scrubber rating
# similiar to the first problem, but this time we select the 
# binary strings that pass the zeros > ones test
  # o2- find most common [0] number, select only those that match
  # continue with [1] until 1 number is left
  # co2 - find least common [0] number, select only those that match
  # continue until 1 number is left
# convert both ratings to decimal
  # life supprt rating - multiply both decimals & return result

# steps
# count all 0s and 1s at each index
  # duplicate the original array to a new array
  # iterate through all strings[0], counting '0' and '1'
  # save the most common occurrence as most_common, and least common as least_common
  # push the most common into o2, and least common into co2
    # if equal amount of 0s and 1s, o2 gets 1, co2 gets 0
  # select all strings where the index is 
  # reset zeros, ones, most_common, least_common to 0/empty strings
  # move on to next iteration for strings[1]
  # ...
  # break if o2/co2 size is the same as one of the input strings



# test case
array = %w(00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010)

# array = []
# File.open('diagnostics.txt') do |f|
#   f.each_line do |line|
#     array << line.chomp
#   end
# end

# duplicate arrays
o2_arr = array.map { |str| str.dup }
co2_arr = array.map { |str| str.dup }

def method(array, var_tbnl)
  index = 0
  results = []
  breakpoint = array.first.size

  # count number of 0s and 1s at index
 # loop do
    zeros = 0
    ones = 0
    common = ''

    array.each do |binary|
      if binary[index] == '0'
        zeros += 1
      elsif binary[index] == '1'
        ones += 1
      end
    end
binding.pry
  #   # add to most/least common
  #   if zeros == ones
  #     common = var_tbnl
  #   elsif zeros > ones
  #     common = '0'
  #   elsif ones > zeros
  #     common = '1'
  #   end

  #   results = array.select { |str| str[index] == common }

  #   index += 1
  #   break if index == breakpoint - 1
  # end
  results
end

p method(o2_arr, '1')
p method(co2_arr, '0')