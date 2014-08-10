=begin
https://www.hackerrank.com/challenges/gem-stones
=end

def count_gems(arr)
  keep_count = Array.new(26, 0)
  (0..(arr.length-1)).each do |i|
    (0..25).each do |j|
      keep_count[j] += 1 if arr[i].count((97+j).chr) > 0
    end
  end
  count = 0
  (0..25).each do |i|
    count += 1 if keep_count[i] == arr.length
  end
  count
end

T = gets.to_i
arr = Array.new(T)
(0..(T-1)).each do |i|
  arr[i] = gets.strip
end
puts count_gems(arr)
