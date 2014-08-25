=begin
https://www.hackerrank.com/contests/w8/challenges/john-and-gcd-list
=end

def gcd(a, b)
  return a if a == b
  big = [a, b].max; small = [a, b].min
  while small > 0
    big, small = small, big % small
  end
  return big
end

T = gets.to_i
T.times do
  n = gets.to_i
  arr = gets.split.map{|i| i.to_i}
  to_return = Array.new(n+1)
  to_return[0] = arr[0]
  (1..(n-1)).each do |i|
    (1..arr[i-1]).each do |j|
      value = arr[i] * j
      if value % arr[i-1] == 0 and gcd(value, to_return[i-1]) == arr[i-1]
        to_return[i] = value
        break
      end
    end
  end
  to_return[n] = arr[n-1]
  answer = to_return.inject(""){|result, i| result + i.to_s + " "}
  puts answer.strip
end
