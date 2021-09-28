# write a method that takes two arguments, a string and integer, and prints the string as many times as the integer indicates

def repeat(string, number)
  number.times do
    puts string
  end
end

repeat('hello', 3)