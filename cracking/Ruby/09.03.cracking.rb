=begin
Given a sorted array of integers that has been rotated an unknown number 
of times, give a O(logn) algorithm that finds an element in the array.
You may assume that the array was originally sorted in increasing order
=end

def find_element(a, x)
	return "empty array" if a.nil? or a.length == 0
	left = 0
	right = a.length - 1
	while right >= left
		middle = (left + right) / 2
		if a[middle] == x
			return middle
		else
			if a[middle] > a[left]
				if x > a[middle]
					left = middle + 1
				else # x < a[middle]
					if x > a[left]
						right = middle - 1
					else # x <= a[left]
						left = middle + 1
					end
				end
			else # a[middle] < a[left]
				if x < a[middle]
					right = middle - 1
				else # x >= a[middle]
					if x < a[right]
						left = middle + 1
					else # x >= a[right]
						right = middle - 1
					end
				end
			end
		end
	end
	"#{x} doesn't exist in this array"
end

arr = [15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14]
puts find_element(arr, 6)