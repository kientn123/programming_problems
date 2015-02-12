=begin
Write a function which takes a 64-bit word x and returns a 64-bit word consisting of the bits of x
in reverse order
=end
def reverse_bits(word)
  res = 0
  while word > 0
    res = res * 2 + (word & 1)
    word >>= 1
  end

  return res
end

puts reverse_bits(6)
puts reverse_bits(10)
