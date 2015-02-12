=begin
Find smallest subarray that sequentially covering all the values
Write a function that takes two integer-value array A and Q and compute a minimum length
subarray A[i:j] that sequentially cover Q. Assume all elements in Q are distinct
=end
def smallest_subarray(arr, q)
	return if arr.length == 0 || arr.length < q.length
	order = Hash.new()
	most_recent= Hash.new()
	min_length = Hash.new()
	0.upto(q.length-1) do |i|
		order[q[i]] = i
	end
	puts "order: " + order.to_s
	res = { length: Float::INFINITY, finish: Float::INFINITY }
	0.upto(arr.length-1) do |i|
		if order[arr[i]]
			position = order[arr[i]]
			if position == 0
				most_recent[position] = i
				min_length[position] = 1
			elsif most_recent[position-1]
				min_length[position] = i - most_recent[position-1] + min_length[position-1]
				most_recent[position] = i
				
				if position == q.length - 1
					if min_length[position] < res[:length]
						res[:length] = min_length[position]
						res[:finish] = i
					end
				end
			end
		end
		puts "most recent: " + most_recent.to_s
		puts "min_length: " + min_length.to_s
	end
	return res
end

q = ["union", "save"]
arr = ["struggle", "is", "to", "save", "the", "union", "the", "save", "union", "and", "union"]
puts smallest_subarray(arr, q)
