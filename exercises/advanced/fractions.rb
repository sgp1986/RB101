# first method
# takes a rational number as an argument
# returns an array of the denominators that are part of an 
# Egyptioan Fraction represented by the number
# eg
#   2 = Rational(2, 1) (2/1) = 1//1, 1/2, 1/3, 1/6 = [1, 2, 3, 6]
#   Rational(137, 60) (137/60) = [1, 2, 3, 4, 5]
#   Rational(3, 1) = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# second method
# takes an array of numbers in same format
# calculates the rational number
# eg
#   [1, 2, 3, 6] = Rational(2, 1)

# see if 1/1 can be part of the solution, then 1/2, then 1/3, 1/4

def egyptian(target_value)
  denominators = []
  unit_denominator = 1
  until target_value == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= target_value
      target_value -= unit_fraction
      denominators << unit_denominator
    end

    unit_denominator += 1
  end

  denominators
end

def unegyptian(denominators)
  denominators.inject(Rational(0)) do |accum, denominator|
    accum + Rational(1, denominator)
  end
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)