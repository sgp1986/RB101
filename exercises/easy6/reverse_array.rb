list = [1, 2, 3, 4]

def swap(array)
  new_array = []

  loop do 
    new_array << array.pop
    break if array.empty?
  end
  array = new_array
end

p list.object_id
p swap(list)
p list.object_id

list2 = %w(a b e d c)

p list2.object_id
p swap(list2)
p list2.object_id

list3 = ['abc']

p list3.object_id
p swap(list3)
p list3.object_id

list4 = [[1, 2], ['a', 'b']]

p list4.object_id
p swap(list4)
p list4.object_id