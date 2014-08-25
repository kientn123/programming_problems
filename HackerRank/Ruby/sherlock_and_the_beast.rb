=begin
https://www.hackerrank.com/challenges/sherlock-and-the-beast
=end

def vaccine(n)
  (0..(n/5)).each do |k|
    if (n - k*5) % 3 == 0
      answer = "5" * (n - k*5) + "3" * k * 5
      return answer.to_i
    end
  end
  return -1
end

T = gets.to_i
T.times do
  puts vaccine(gets.to_i)
end
