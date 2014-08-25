=begin
https://www.hackerrank.com/challenges/mark-and-toys
=end

def num_toys(arr, money)
  arr.sort!
  total = 0
  (0..arr.length - 1).each do |i|
    if total + arr[i] <= money
      total += arr[i]
      return i + 1 if i == arr.length - 1
    else
      return i
    end
  end
end

n, money = gets.split(/\s/).map(&:to_i)
prices = gets.split(/\s/).map(&:to_i).sort


answer = num_toys(prices, money)

puts answer
