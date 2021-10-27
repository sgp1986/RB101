def multiply_list(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |num, idx|
    new_arr << num * arr2[idx]
  end
  new_arr
end

p multiply_list([3, 5, 7], [9, 10, 11])
