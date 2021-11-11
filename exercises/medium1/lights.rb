# you have n switches connected to n lights, initially turned off.
# each switch/light is numbered from 1 .. n.
# round 1: toggle every switch (all on)
# round 2: toggle every even switch (2, 4, 6 are now off)
# round 3: toggle 3, 6, 9... (3 is off, 6 is on, 9 is off, 12 is on)
# round 4: continue with 4, 8, 12, 16...
# round 5: continue with 5, 10, 15, 20... until n rounds
# write a method that takes one argument, n (number of switches) and returns
# an array identifying which lights are on after n repititions

# for n
# start with 1, toggle multiples of 1
# next start with 2, toggle multiples of 2
# next start with 3, toggle multiples of 3
# ...
# start with n, toggle multiples of n (will only be the 1 multiple)

# how to determine on off status
# 1/0?

# 0000000000
# 1111111111
# 1010101010
# 1000111000
# 1001111100
# 1001011101
# 1001001101
# 1001000101
# 1001000001
# 1001000011
# 1001000010

# if 1, [e] = 0, if 0, [e] = 1

# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = 'off' }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == 'off') ? 'on' : 'off'
    end
  end
end

# run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)