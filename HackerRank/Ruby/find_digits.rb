=begin
https://www.hackerrank.com/challenges/find-digits
=end

T = gets.to_i
T.times do
  n = gets.to_i
  digits = n.to_s.chars.map{|x| x.to_i}
  answer = 0
  digits.each do |digit|
    answer += 1 if digit != 0 and n % digit == 0
  end
  puts answer
end
