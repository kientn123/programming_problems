=begin
https://www.hackerrank.com/contests/w8/challenges/gneck
=end

def comb(n, k)
  a = Array.new(n, 0)
  a.combination(k).to_a.length
end

def num_necklaces(n)
  total = 1
  max_b = (n-1)/3 + 1
  (1..max_b).each do |i|
    num_b = i
    num_r = n - (num_b - 1) * 2 - num_b
    sub_total = comb(num_b + num_r, num_r)
    total += sub_total
  end
  total
end

t = gets.to_i
t.times do
  n = gets.to_i
  puts n.to_s + ": " + num_necklaces(n).to_s
end
