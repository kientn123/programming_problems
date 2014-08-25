=begin
https://www.hackerrank.com/challenges/game-of-thrones
=end

# Enter your code here. Read input from STDIN. Print output to STDOUT

string = gets.chomp

found = 0
# Assign found a value of 1 or 0 depending on whether or not you found what you were looking for.
count_arr = Array.new(26, 0)
string.each_char do |char|
  count_arr[char.ord - "a".ord] += 1
end
num_odd = 0
count_arr.each do |e|
  num_odd += 1 if e % 2 == 1
end

found = 1 if num_odd <= 1

if found == 1
    puts "YES"
else
    puts "NO"
end
