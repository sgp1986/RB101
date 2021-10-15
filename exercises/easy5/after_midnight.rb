# write a method that takes a time using a minutes based format
# of before or after midnight and returns the time of day in 24
# hour format. positive numbers are after midnight, negative is
# before midnight. 0 is midnight

# rules/requirements
# - midnight is 00:00
# - a positive number is after midnight
#   - 3 == 00:03, 800 == 13:20
# - a negative number is before midnight
#   - -3 == 23:57, -180 == 21:00
# - going past 24 hours results in same time
#   - 24 hours is 1440 minutes
#   - -1437 == 00:03, 1500 == 01:00
# -input
#   - integer
# - output
#   - string of 4 integers 00:00

# test cases
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# data structures
# integers, strings

# algorithm
# - start at midnight with 0 = 00:00
# - integer 0 - 59 return 00:number
# - greater than 60 calculate number of hours and minutes using %
#     - 60 % 60 == 0 125 % 60 == 5

# num %= 1440 works in ruby but not other languages, must normalize the number first (take from negative to positive)

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

time_of_day(0)
time_of_day(-3)
time_of_day(35)
time_of_day(-1437)
time_of_day(3000)
time_of_day(800)
time_of_day(-4231)
time_of_day(270)
time_of_day(-270)


def after_midnight(time)
  arr = time.split(':')
  minutes = (arr[0].to_i * MINUTES_PER_HOUR) + arr[1].to_i
  if minutes > 1439
    minutes -= MINUTES_PER_DAY
  else
    minutes
  end
end

def before_midnight(time)
  arr = time.split(':')
  minutes = MINUTES_PER_DAY - ((arr[0].to_i * MINUTES_PER_HOUR) + arr[1].to_i)
  if minutes > 1439
    minutes -= MINUTES_PER_DAY
  else
    minutes
  end
end

# 12:34 = 00:00 + 754
# 12:34 = 00:00 - 686

p after_midnight('00:00')
p before_midnight('00:00')
p after_midnight('12:34')
p before_midnight('12:34')
p after_midnight('24:00')
p before_midnight('24:00')
p after_midnight('04:30')
p before_midnight('19:30')
p after_midnight('25:00')