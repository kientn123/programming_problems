=begin
Write a function that takes as input an integer n and returns the n-th integer
in the look-and-say sequence. Return the result as string
=end
def look_and_say(n)
  res = '1'
  (n-1).times do
    res = look_and_say_next(res)
  end
  return res
end

def look_and_say_next(str)
  res = ''
  i = 0
  while i<str.length
    count = 1
    while i+1 < str.length && str[i] == str[i+1]
      count += 1
      i += 1
    end
    res += count.to_s + str[i]
    i += 1
  end
  res
end

puts look_and_say(5)
puts look_and_say_next('13112221')
puts look_and_say_next('1')
