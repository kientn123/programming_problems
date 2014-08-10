=begin
https://www.hackerrank.com/challenges/manasa-and-stones
=end

T = gets.to_i
T.times do
  n = gets.to_i
  a = gets.to_i
  b = gets.to_i
  big = [a, b].max
  small = [a, b].min
  if big == small
    num = (n-1)*big
    answer = num.to_s.strip
    puts answer
  else
    answer = ""
    (0..(n-1)).each do |i|
      num = i * big + (n-1-i)*small
      answer += num.to_s + " "
    end
    puts answer.strip
  end
end
