=begin
https://www.hackerrank.com/challenges/maximizing-xor
=end

def maxXor(l, r)
  n = l ^ r
  m = n.to_s(2)
  return 0 if m.eql? "0"
  (0..(m.length - 1)).each do |i|
    m[i] = "1"
  end
  m.to_i(2)
end
l = gets.to_i
r = gets.to_i
print maxXor(l, r)
