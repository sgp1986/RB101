# selection
hsh = {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}
counter = 0

new_hsh = {}

for letter, fruit in hsh
  new_hsh[letter] = fruit if fruit.size > 4
end

# transformation
def star_method(stars)
  arr = []
  stars.each do |star|
    arr.push(star.upcase)
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

# methods
['a', 'b', 'c'].select do |item|
  puts item
end
# => []

['green', 'blue', 'red'].map do |word|
  puts word
  word.upcase
end
# => ['GREEN', 'BLUE', 'RED']

{a: 1, b: 2, c: 3, d: 4, e: 5}.each do |_, num|
  plus_one = num + 1
  puts "#{num} plus 1 is #{plus_one}"
end
# => {:a => 1, :b => 2, :c => 3, :d => 4, :e => 5}

flavors = ['chocolate', 'strawberry', 'mint', 'vanilla']
flavors.reject { |flavor| puts flavor }
# => ["chocolate", "strawberry", "mint", "vanilla"] 

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers, even_numbers = numbers.partition do |number|
                              number.odd?
                            end

# ----------------                            
a = 2
b = rand(2)
a *= b

if a == 2
  puts 'Two'
else
  puts 'Not Two'
end

#-----------------
def extend_greeting(greeting)
  greeting + " there"
end

greeting = "hi"
extend_greeting(greeting)

puts greeting

#------------------
