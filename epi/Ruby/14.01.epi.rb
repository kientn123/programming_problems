=begin
Given sorted arrays A and B of lengths n and m respectively, return an array C containing
elements common to A and B. The array C should be free of duplicates. How would you perform
this intersection if
1. n ~ m
2. n << m
=end
def intersection_v1(a, b)
	i = 0; j = 0
	res = []
	while i < a.length && j < b.length
		if a[i] == b[j] && (a[i] != a[i-1] || i == 0) 
			res << a[i]
			i += 1
			j += 1
		elsif a[i] < b[j]
			i += 1
		else 
			j += 1
		end
	end
	return res
end

def intersection_v2(a, b)
	res = []
	0.upto(a.length - 1) do |i|
		if (i == 0 || a[i] != a[i-1]) && binary_search(b, a[i])
			res << a[i]
		end
	end
	res
end

def binary_search(arr, num)
	return false if arr.length == 0
	left = 0; right = arr.length - 1
	until left > right
		mid = (left + right) / 2
		if arr[mid] == num
			return true
		elsif arr[mid] < num
			left = mid + 1
		else
			right = mid - 1
		end
	end
	return false
end

a = [1,2,3,5,9,13,14]
b = [2,4,5,6,9,12,13]
puts intersection_v1(a, b).to_s
puts intersection_v2(a, b).to_s