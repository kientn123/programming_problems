=begin
Find the largest subarray where all element are distinct
=end
def largest_all_distinct(arr)
	return if arr.length == 0
	most_recent = Hash.new
	start = 0
	res = { distance: 1, final: 0 }
	1.upto(arr.length-1) do |runner|
		if most_recent[arr[runner]].nil? || most_recent[arr[runner]] < start
			distance = runner - start
			if distance > res[:distance]
				res[:distance] = distance
				res[:final] = runner
			end
		else
			start = most_recent[arr[runner]] + 1
		end
		most_recent[arr[runner]] = runner
	end
	return res
end
arr = [5,7,5,11,13,2,11,19,2,11]
puts largest_all_distinct(arr)