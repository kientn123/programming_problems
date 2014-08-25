=begin
https://www.hackerrank.com/challenges/closest-numbers
=end

def closest_pairs(arr)
  arr.sort!
  abs_arr = Array.new(arr.length - 1)
  (1..arr.length - 1).each do |i|
    abs_arr[i-1] = (arr[i]-arr[i-1]).abs
  end
  min = abs_arr.min
  answer = Array.new
  (1..arr.length - 2).each do |i|
    answer << [arr[i], arr[i+1]] if arr[i+1] - arr[i] == min
  end
  answer
end

n = gets.to_i
arr = gets.strip.split.map {|x| x.to_i}
puts closest_pairs(arr).join(" ")
