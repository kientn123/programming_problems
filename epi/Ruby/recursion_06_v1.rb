=begin
Enumerate power set of an array that may have duplicates
=end

def enumerate(arr)
  arr.sort!
  ans = Array.new
  puts ans.to_s
  helper(arr, 0, ans)
end

def helper(arr, start, ans)
  unless ans.empty?
    puts ans.to_s
  end
  start.upto(arr.length-1) do |i|
    if i == start || arr[i] != arr[i-1]
      ans << arr[i]
      helper(arr, i+1, ans)
      ans.pop
    end
  end
end

enumerate([1,2,3,2])
