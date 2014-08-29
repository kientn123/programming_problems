=begin
Given a sorted array of strings which is interspersed with empty strings, 
write a method to find the location of a given string
=end

def find_string(arr, str)
	left = 0
	right = arr.length
	while left <= right
		while right >= left and arr[right].eql?("")
			right -= 1
		end
		return -1 if right < left
		middle = (left + right) / 2
		while arr[middle].eql?("")
			middle += 1 
			# always find 1 that is not empty since right is not an empty string
		end
		if arr[middle].eql?(str)
			return middle
		elsif arr[middle] < str
			left = middle + 1
		else
			right = middle - 1
		end
	end
	-1
end

arr1 = ['at', '', '', '', 'ball', '', '', 'car', '', '', 'dad', '', '']
arr2 = ['at', '', '', '', '', 'ball', 'car', '', '', 'dad', '', '']
puts find_string(arr1, 'ball')
puts find_string(arr2, 'ballcar')