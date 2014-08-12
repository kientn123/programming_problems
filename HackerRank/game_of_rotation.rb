=begin
https://www.hackerrank.com/challenges/game-of-rotation
=end

def guarantee(arr, n)
  sum = arr.inject(0) {|s, e| s + e}
  max = total(arr, n, 0)
  runner = max
  (1..n - 1).each do |i|
    sub_case = runner - sum + n * arr[i - 1]
    runner = sub_case
    max = sub_case if sub_case > max
  end
  max
end

def total(arr, n, start_index)
  t = 0
  (0..n - 1).each do |i|
    t += ((n - start_index + i) % n + 1) * arr[i]
  end
  t
end

n = gets.to_i
arr = gets.split.map {|x| x.to_i}
puts guarantee(arr, n)
