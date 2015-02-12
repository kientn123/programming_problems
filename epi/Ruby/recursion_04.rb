=begin
Enumerate permutations
=end

def enumerate_permutations(arr)
  res = Array.new
  helper(0, arr, res)
  res
end

def helper(k, arr, res)
  if k == arr.length
    res << arr[0..arr.length-1]
  else
    k.upto(arr.length-1) do |i|
      swap(arr, i, k)
      helper(k+1, arr, res)
      swap(arr, i, k)
    end
  end
end

def swap(arr, i, k)
  if i != k
    arr[i], arr[k] = arr[k], arr[i]
  end
end

arr = [1,2,3,4]
res = enumerate_permutations(arr)
0.upto(res.length-1) do |i|
  puts res[i].to_s
end
