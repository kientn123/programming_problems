=begin
Design an efficient algorithm that takes as input an array A of even length and computes a
2-task assignment of A that has minimum Q(T) where
T is a collection of m subsets of elements of A, each of size 2
Q(T) is the maximum of the subset sum in T
=end
# The collection where the longest task is paired with the shortest task yields the optimum
# result
def assignment(arr)
	arr.sort!
	res = Array.new
	0.upto(arr.length/2 - 1) do |i|
		res << [arr[i], arr[arr.length-1-i]]
	end

	return res
end

arr = [1,3,7,2,9,4,6,8]
puts assignment(arr).to_s
