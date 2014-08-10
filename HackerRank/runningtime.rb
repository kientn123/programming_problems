=begin
https://www.hackerrank.com/challenges/runningtime
=end

def insertion_sort(arr)
  count = 0
  (1..(arr.length-1)).each do |i|
    index = i
    (i-1).downto(0) do |j|
      if arr[j] > arr[index]
        arr[j], arr[index] = arr[index], arr[j]
        index = j
        count += 1
      else
        break
      end
    end
  end
  count
end

s = gets.to_i
arr = gets.split.map{|x| x.to_i}
puts insertion_sort(arr)
