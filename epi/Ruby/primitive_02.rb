=begin
Implement code that takes as input a 64-bit integer and swaps the bits in that integer at indices
i and j
=end
def swap_bits(bits, i, j)
  bit_at_i = (bits >> i) & 1
  bit_at_j = (bits >> j) & 1
  if bit_at_i != bit_at_j
    bits ^= (1 << i) | (1 << j)
  end

  bits
end

puts swap_bits(73, 1, 6)
