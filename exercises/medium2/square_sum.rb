# write a method that computes the difference between the square
# of the sum of the first n positive integers and the sum of the 
# squares of the first n positive integers
# input integer 3
# square of the sums => (1 + 2 + 3)**2 => 36 
# sum of the squares => (1**2 + 2**2 + 3**2) => 14
# 36 - 14 => 22

def sum_square_difference(int)
  squaresum = 0
  sumsquare = 0

  1.upto(int) do |num|
    squaresum += num
    sumsquare += num**2
  end
  squaresum**2 - sumsquare
end

p sum_square_difference(3)
p sum_square_difference(10)
p sum_square_difference(1)
p sum_square_difference(100)