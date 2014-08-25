=begin
https://www.hackerrank.com/challenges/chocolate-feast
=end

t = gets.to_i
t.times do
  (n, c, m) = gets.split.map{|i| i.to_i}
  answer = n/c
  num_wrappers = answer
  while num_wrappers >= m do
    n = num_wrappers / m
    answer += n
    num_wrappers = (num_wrappers - n*m + n)
  end
  puts answer
end
