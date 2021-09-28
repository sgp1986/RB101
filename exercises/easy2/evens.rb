# Print all odd numbers from 1 to 99 on separate lines

(1..100).each { |num| puts num if num.even? }