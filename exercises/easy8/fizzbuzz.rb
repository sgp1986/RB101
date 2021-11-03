def fizzbuzz(num1, num2)
  numbers = []
  num2.times do
    numbers << num1
    num1 += 1
  end

  numbers = numbers.map do |num|
    if num % 3 == 0 && num % 5 == 0
      num = "FizzBuzz"
    elsif num % 5 == 0
      num = "Buzz"
    elsif num % 3 == 0
      num = "Fizz"
    else
      num
    end
  end

  numbers
end

p fizzbuzz(1, 15)