=begin
https://www.hackerrank.com/challenges/the-love-letter-mystery
=end

def count_ops(str)
    sum = 0
    (0..((str.length-2)/2)).each do |i|
        sum += (str[i].ord - str[str.length-1-i].ord).abs
    end
    sum
end

T = gets.to_i
T.times do
    puts count_ops(gets.strip)
end
