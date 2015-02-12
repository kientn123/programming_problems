=begin
Find the length of the longest contained range
Write a function which takes as input a set of integers represented by an array A, and returns
the size of the biggest range [x..y] contained in the set.
=end
def longest_range(arr)
	return if arr.length == 0
	hash = Hash.new
	arr.each do |ele|
		hash[ele] = true
	end
	res = { range: 0, final: 0 }
	arr.each do |target|
		break if hash.length == 0
		if hash[target]
			hash.delete(target)
			local_range = { range: 1, final: target}
			i = target + 1
			until hash.length == 0
				if hash[i]
					hash.delete(i)
					local_range[:range] += 1
					local_range[:final] = i
				else
					break
				end
				i += 1
			end
			
			i = target - 1
			until hash.length == 0
				if hash[i]
					hash.delete(i)
					local_range[:range] += 1
				else
					break
				end
				i -= 1
			end
			
			if local_range[:range] > res[:range]
				res[:range] = local_range[:range]
				res[:final] = local_range[:final]
			end
		end
	end
	return res
end

arr = [3,-2,7,9,8,1,2,0]
puts longest_range(arr)