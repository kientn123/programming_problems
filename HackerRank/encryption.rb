=begin
https://www.hackerrank.com/challenges/encryption
=end

def encode(mes)
  width = Math.sqrt(mes.length).ceil;
  arr = Array.new(width)
  i = 0
  width.times do
    k = i
    word = ""
    while k < mes.length
      word += mes[k]
      k += width
    end
    arr[i] = word
    i += 1
  end
  arr
end

mes = gets.strip.split.join("")
arr = encode(mes)
puts arr.join(" ")
