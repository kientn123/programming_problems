=begin
https://www.hackerrank.com/challenges/halloween-party
=end

def max_pieces(n)
  (n/2) * (n-(n/2))
end

T = gets.to_i
(1..T).each do
  puts max_pieces(gets.to_i)
end
