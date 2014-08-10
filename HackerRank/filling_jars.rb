=begin
https://www.hackerrank.com/challenges/filling-jars
=end

n, m = gets.split.map{|x| x.to_i}
total = 0
m.times do
  a, b, k = gets.split.map{|x| x.to_i}
  total += (b - a + 1)*k
end
puts total/n
