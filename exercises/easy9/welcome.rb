# create a method that takes two arguments, an array and a hash
# the array will have 2+ elements that combined with a space form a name
# the hash will have two keys, title and occupation
# the method should return a greeting that uses all values

def greetings(name, work)
  puts "Hello, #{name.join(' ')}! Nice to have a #{work[:title]} #{work[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })