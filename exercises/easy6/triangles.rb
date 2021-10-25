# write a method that takes a positive integer n as an argument
# and displays a right triangle whose sides each have n starts


def triangle(num)
  counter = 1
  loop do
    break if counter > num
    puts "#{" " * (num - counter)}#{"*" * (counter)}"
    counter += 1
  end
end

triangle(9)