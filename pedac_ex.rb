def sum_of_multiples(target, factors)
  multiples = []
  factors = [3, 5] if factors.length == 0

  factors.each do |factor|
    current_multiple = factor

    while current_multiple < target
      multiples << current_multiple
      current_multiple += factor
    end
  end

  multiples.uniq.inject(0, :+)
end

p sum_of_multiples(20, [3, 5])
p sum_of_multiples(20, [3])
p sum_of_multiples(20, [5])
p sum_of_multiples(20, [])
p sum_of_multiples(1, [])
p sum_of_multiples(20, [19])

  