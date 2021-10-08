# write a method that searches for multiples of 3 or 5 between 1
# and an entered number and computes the sum of those numbers
# ex. num = 20 = (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20) = 98

# PEDAC already done in PEDAC notes
# C

def multisum(number)
  multiples = []
  factors = [3, 5]
  
  factors.each do |factor|
    current_multiple = factor

    while current_multiple <= number
      multiples << current_multiple
      current_multiple += factor
    end
  end

  p multiples.uniq.inject(0, :+)
end

multisum(3)
multisum(5)
multisum(10)
multisum(1000)