=begin
https://www.hackerrank.com/challenges/sherlock-and-queries
=end

n, m = gets.split.map{|x| x.to_i}
a = gets.split.map{|x| x.to_i}
b = gets.split.map{|x| x.to_i}
c = gets.split.map{|x| x.to_i}

(1..m).each do |i|
  (1..n).each do |j|
    a[j-1] *= c[i-1] if j % b[i-1] == 0
  end
end

answer = a.inject("") {|result, num| result + (num%(10 ** 9 + 7)).to_s + " "}
puts answer.strip
