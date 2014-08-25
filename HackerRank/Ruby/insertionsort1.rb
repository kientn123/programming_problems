=begin
https://www.hackerrank.com/challenges/insertionsort1
=end

def insertion_sort(arr)
  index = arr.length - 1
  value = arr[arr.length - 1]
  (arr.length - 2).downto(0) do |j|
    if arr[j] > value
      arr[index] = arr[j]
      index = j
      puts arr.join(" ")
      if index == 0
        arr[index] = value
        puts arr.join(" ")
      end
    else
      arr[index] = value
      puts arr.join(" ")
      break
    end
  end
end

s = gets.to_i
arr = gets.split.map{|x| x.to_i}
insertion_sort(arr)
