=begin
Enumerate the power set
=end

def enumerate_power_set(arr)
  vect = Array.new
  puts vect.to_s
  helper(arr, 0, vect)
end

def helper(arr, start, vect)
  unless vect.empty?
    puts vect.to_s
  end
  start.upto(arr.length-1) do |i|
    vect << arr[i]
    helper(arr, i+1, vect)
    vect.pop
  end
end

# Cost memory and time to copy array
# def enumerate_power_set_2(arr)
#   res = [[]]
#   return res if arr.length == 0
#   1.upto(arr.length) do |num|
#     0.upto(arr.length-1) do |start|
#       helper_2(arr, num, start, [arr[start]], res)
#     end
#   end
#   return res
# end
#
# def helper_2(arr, num, start, cur, res)
#   if cur.length == num
#     res << cur[0..cur.length-1]
#   else
#     (start+1).upto(arr.length-1) do |i|
#       helper(arr, num, i, cur+[arr[i]], res)
#     end
#   end
# end

# def swap(arr, i, j)
#   if i != j
#     arr[i], arr[j] = arr[j], arr[i]
#   end
# end

puts enumerate_power_set([1,2,3,4])
