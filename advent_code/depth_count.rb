#PART 1
# take a list of depth measurements, count the number of times
# the depth increases from the last depth.
# starting at index 1, test if idx 1 is larger than idx 0
#   if true, count idx 1
#   if false, move to next

# 199  A      
# 200  A B    
# 208  A B C  
# 210    B C D
# 200  E   C D
# 207  E F   D
# 240  E F G  
# 269    F G H
# 260      G H
# 263        H

# Window Sums
# A: 607 (N/A - no previous sum)
# B: 618 (increased)
# C: 618 (no change)
# D: 617 (decreased)
# E: 647 (increased)
# F: 716 (increased)
# G: 769 (increased)
# H: 792 (increased)
# 5 increases

#PART 2
# consider sums of 3-measurement sliding windows
# first window A = (199, 200, 209) sum = 607
# second window B = (200, 208, 210) sum = 618
# sum of window B is larger than sum of window A, so this is
  # increase
# count the number of times the 3 measurement window sums increase
# stop when there aren't enough measurements to create new window

# algorithm
# starting at idx 0, group the first 3 elements and find the sum- GROUP A
# starting at idx 1, group the first 3 elements and find the sum- GROUP B
# if B > A, increase depth_count
# else, skip to next windows
# GROUP A starts idx 1, group first 3, find sum
# GROUP B, starts idx 2, group first 3, find sum


def count_depths(array)
  depth_count = 0
  a_idx = 0
  b_idx = 1
  
  loop do
    group_a = array[a_idx, 3].sum
    group_b = array[b_idx, 3].sum
    if group_b > group_a
      depth_count += 1
      a_idx += 1
      b_idx += 1
    else
      a_idx += 1
      b_idx += 1
    end
    break if (b_idx + 2) == array.size
  end
  depth_count
end

# test case
# depths = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
depths = []
File.open('depths.txt') do |f|
  f.each_line do |line|
    depths << line.to_i
  end
end

p count_depths(depths)