=begin
Find unique elements OR Delete duplicates
Design an efficient algorithm for removing all the duplicates from an array
=end
# O(kn) time where k is # distinct entries & O(1) space
def delete_duplicates(arr)
	return if arr.length == 0
	last = 1
	1.upto(arr.length - 1) do |i|
		found = false
		0.upto(last-1) do |j|
			if arr[i] == arr[j]
				found = true
				break
			end
		end
		if found
			next
		else
			arr[last] = arr[i] 
			last += 1
		end
	end
	until last >= arr.length
		arr[last] = nil
		last += 1
	end
end
arr = [1,2,4,2,4,5,2,5,6,2,4,5,6]
delete_duplicates(arr)
puts arr.to_s

# O(nlogn) time and O(1) space. Sort array first, then remove
def delete_duplicates_v2(arr)
	arr.sort!
	last = 1
	1.upto(arr.length-1) do |i|
		if arr[i] == arr[i-1]
			next
		else
			arr[last] = arr[i]
			last += 1
		end
	end
	until last >= arr.length
		arr[last] = nil
		last += 1
	end
end

arr = [1,2,4,2,4,5,2,5,6,2,4,5,6]
delete_duplicates_v2(arr)
puts arr.to_s

# O(n) time and O(k) space where k is # distinct entries in array
def delete_duplicates_v3(arr)
	hash = Hash.new
	last = 0
	0.upto(arr.length-1) do |i|
		if hash[arr[i]]
			next
		else
			arr[last] = arr[i]
			last += 1
			hash[arr[i]] = true
		end
	end
	until last >= arr.length
		arr[last] = nil
		last += 1
	end
end

arr = [1,2,4,2,4,5,2,5,6,2,4,5,6]
delete_duplicates_v3(arr)
puts arr.to_s