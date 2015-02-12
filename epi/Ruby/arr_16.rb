=begin
Sample offline data
Let A be an array whose entries are all distinct. Implement an algorithm that
takes A and an integer k and returns a subset of k elements of A. All subsets
should be equally likely. Use as few calls to teh random number generator
(which returns random integers) as possible and use O(1) additional storage.
You can return the result in the same array as input
=end
def sample_data(arr, k)
  0.upto(k-1) do |i|
    ran_index = rand(i..arr.length)
    swap(arr, i, ran_index)
  end
  return arr
end

def swap(arr, i, j)
  arr[i], arr[j] = arr[j], arr[i]
end

arr = [3,2,5,7,1,8,6,9,0]
puts sample_data(arr, 4).to_s
