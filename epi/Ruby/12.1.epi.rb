=begin
Return the first occurrance of k in a sorted array (duplicates allowed)
=end

def find_k(arr, k)
	left = 0
	right = arr.length - 1
	result = -1
	until left > right
		mid = (left + right) / 2
		if arr[mid] == k
			result = mid
			right = mid - 1
		elsif arr[mid] > k
			right = mid - 1
		else
			left = mid + 1
		end
	end
	return result
end

a = [1, 1, 2, 3, 3, 4, 5, 6, 6, 6, 7]
puts find_k(a, 3)
