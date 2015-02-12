=begin
Compute a random permutation
=end
def random_permutation(arr)
  0.upto(arr.length-1) do |i|
    ran_index = rand(i..arr.length-1)
    swap(arr, i, ran_index)
  end
  return arr
end

def swap(arr, i, j)
  arr[i], arr[j] = arr[j], arr[i]
end

arr = [0,1,2,3,4,5,6,7,8,9]
puts random_permutation(arr).to_s
