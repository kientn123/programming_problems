=begin
https://www.hackerrank.com/challenges/angry-children/submissions/code/1910200
=end

def min_unfairness(arr, n, k)
  arr.sort!
  min = arr[k-1] - arr[0]
  (1..(n-k)).each do |i|
    fairness = arr[i + k - 1] - arr[i]
    min = fairness if fairness < min
  end
  min
end

n = gets.to_i
k = gets.to_i
candy = Array.new(n)
for i in 0..n-1
      candy[i] = gets.to_i
end
ans = min_unfairness(candy, n, k)
puts ans
