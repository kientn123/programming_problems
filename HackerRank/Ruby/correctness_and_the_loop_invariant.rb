=begin
https://www.hackerrank.com/challenges/correctness-invariant
=end

def insertion_sort(arr)
  (1..(arr.length-1)).each do |i|
    index = i
    (i-1).downto(0) do |j|
      if arr[j] > arr[index]
        arr[j], arr[index] = arr[index], arr[j]
        index = j
      else
        break
      end
    end
  end
end

s = gets.to_i
arr = gets.split.map{|x| x.to_i}
insertion_sort(arr)
puts arr.join(" ")
