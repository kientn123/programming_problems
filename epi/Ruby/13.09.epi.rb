=begin
Find the smallest subarray covering all values
Let A and Q be arrays of strings. Define the subarray A[i:j] to cover Q if for all k in
[0, Q.length-1], there exists l in [i,j] such that A[l] = Q[k]. Write a function which takes
Q and A and computes the minimum length of the subarray A[i:j] that covers Q
=end
def smallest_subarray(q, arr)
	return if arr.length == 0 || arr.length < q.length
	res = {distance: arr.length, start: 0, finish: arr.length-1}
	most_recent = Hash.new()
	linked_list = [] # temporarily use array as linked list
	q.each do |word|
		most_recent[word] = Node.new(-1)
	end
	0.upto(arr.length-1) do |i|
		if most_recent[arr[i]]
			if most_recent[arr[i]].value != -1
				linked_list.delete(most_recent[arr[i]])
			end
			linked_list << Node.new(i)
			most_recent[arr[i]] = linked_list[-1]
			if linked_list.length == q.length
				distance = linked_list[-1].value - linked_list[0].value + 1
				if distance < res[:distance]
					res[:distance] = distance
					res[:start] = linked_list[0].value
					res[:finish] = linked_list[-1].value
				end
			end
		end
		#puts most_recent
		#puts linked_list.to_s
	end
	return res
end

class Node
	attr_accessor(:value)
	def initialize(value)
		@value = value
	end
end

q = ["save", "union"]
arr = ["struggle", "is", "to", "save", "the", "save", "the", "union", "and", "union"]
puts smallest_subarray(q, arr)