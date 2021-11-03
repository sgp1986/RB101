def buy_fruit(list)
  expanded_list = []
  list.map do |item|
    fruit, quantity = item[0], item[1]
    quantity.times { expanded_list << fruit }
  end
  expanded_list
end

p buy_fruit([['apples', 3], ['orange', 1], ['bananas', 2]])