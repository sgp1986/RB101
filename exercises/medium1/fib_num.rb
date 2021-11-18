def fibonacci(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

p fibonacci(100000501)