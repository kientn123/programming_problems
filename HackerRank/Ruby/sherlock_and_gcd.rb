=begin
https://www.hackerrank.com/challenges/sherlock-and-gcd
=end

def gcd(a, b)
  big = [a, b].max; small = [a, b].min
  return a if a == b
  while small > 0
    big, small = small, big % small
  end
  big
end

def gcd_set(arr)
  result = arr[0]
  arr.each do |num|
    result = gcd(result, num)
  end
  result
end

T = gets.to_i
T.times do
  n = gets.to_i
  arr = gets.split.map{|x| x.to_i}
  puts gcd_set(arr) == 1 ? "YES" : "NO"
end
