=begin
Compute parity
The parity of a binary word is 1 if the number of 1s in the word is odd; otherwise, it is 0.
How would you compute the parity of a very large number of 64-bit words
=end
def parity(word)
  res = 0
  while word > 0
    res ^= (word & 1)
    word >>= 1
  end

  return res
end

puts parity(5)
puts parity(7)
