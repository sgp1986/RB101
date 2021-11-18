require 'date'

def friday_13th(year)
  count = 0
  months = (1..12)

  months.each do |month|
    date = Date.new(year, month, 13)
    count += 1 if date.friday?
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2