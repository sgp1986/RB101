# write a method that takes a floating point number that represents
# an angle between 0 and 360 degrees and returns a string that
# represents that angle in degrees, minutes, and seconds
# explicit
# -a degree symbol represents degrees, a single quote represents
# minutes, and double quote represents seconds
# -a degree has 60 minutes, a minute has 60 seconds
# -should be printed as two digit numbers with leading zeros
# implicit
# -math
#   -degrees is any number before decimal
#   -minutes is remaining decimal points * 60
#   -seconds is remaining minutes decimal points * 60
#   ex. angle = 76.73
#     degrees = 76
#     minutes = 0.73 * 60 = 43.8 = 43
#     seconds = 0.8 * 60 = 48

# D- float input, string output in format of %(00.00'00")
# A
# given an integer/float input
# 1. ensure input is converted to float
# 2. remove the whole number from the decimals
#     -save as the degrees
# 3. take the remaining decimal points * 60
#     -remove the whole number from the decimals
#     -save as the minutes
# 4. take the remianing decimal points * 60
#     -save as the seconds
# 5. print the resulting string in 2 digit format 

# remove the whole number from the decimals
# need to return both sides of the decimal
# left side whole number
# right side decimals
# convert float to integer to create the left side whole number
# subract the integer from the float to create the right side decimals

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
TOTAL_DEGREES = 360



def dms(angle)
  angle %= TOTAL_DEGREES
  # degrees = angle.to_i
  # minutes_calc = (angle - degrees) * 60
  # seconds_calc = (minutes_calc - minutes_calc.to_i) * 60
  # minutes = minutes_calc.to_i
  # seconds = seconds_calc.to_i
  total_seconds = (angle * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end


p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
