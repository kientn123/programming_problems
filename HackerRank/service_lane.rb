=begin
https://www.hackerrank.com/challenges/service-lane
=end

def min(width_array, i, j)
    min_num = width_array[i]
    ((i+1)..j).each do |k|
        min_num = width_array[k] if width_array[k] < min_num
    end
    return min_num
end

N, T = gets.split.map { |x| x.to_i }
width_arr = gets.split.map { |x| x.to_i }
(1..T).each do
   i, j = gets.split.map { |x| x.to_i }
  puts min(width_arr, i, j)
end
