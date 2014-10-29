=begin
Design an efficient algorithm for computing the GCD of two numbers without using multiplication,
division or modulus operators
=end
def gcd(a, b)
  puts [a, b].to_s
  return b if a == 0
  return a if b == 0
  if (a&1) == 0 && (b&1) == 0
    return gcd(a >> 1, b >> 1)
  elsif (a&1) == 0 && (b&1) == 1
    return gcd(a >> 1, b)
  elsif (a&1) == 1 && (b&1) == 0
    return gcd(a, b >> 1)
  else
    return gcd([a,b].min, (a-b).abs)
  end
end

puts gcd(24,300)
