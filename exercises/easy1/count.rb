# write a method that counts the number of occurrences of each element in an array

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck', 
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  counts = {}

  array.uniq.each do |vehicle|
    counts[vehicle] = array.count(vehicle)
  end

  counts.each do |vehicle, count|
    puts "#{vehicle} => #{count}"
  end

end

count_occurrences(vehicles)
