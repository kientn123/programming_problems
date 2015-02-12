=begin
find the position of the smallest element in a cyclically sorted array
=end

def find_smallest(a)
	left = 0
	right = a.length - 1
	until left >= right
		mid = (left + right) / 2
		if a[mid] > a[right]
			left = mid + 1
		else
			right = mid
		end
	end
	return right
end

a = [378, 478, 550, 631, 103, 203, 220, 234, 279, 368]
puts find_smallest(a)
