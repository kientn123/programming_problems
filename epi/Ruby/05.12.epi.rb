=begin
Generate uniform random number
How would you implement a random number generator that generates a random intger i between a and b,
inclusive, given a random number generator that produces either zero or one with equal probability?
All generated values should be equally likely.
=end
def generate_random(a, b)
  range = b - a
  res = 0
  loop do
    res = 0
    i = 0
    while (1 << i) <= range
      res = res * 2 + rand(0..1)
      i += 1
    end

    if res <= range
      break
    end
  end

  return res + a
end

puts generate_random(1,5)
puts generate_random(1,5)
puts generate_random(1,5)
puts generate_random(1,5)
puts generate_random(1,5)
puts generate_random(1,5)
puts generate_random(1,5)
puts generate_random(1,5)
puts generate_random(1,5)
puts generate_random(1,5)
