=begin
You're given a set of n tasks modeled as closed intervals [ai, bi]. A set S of visit times
covers the tasks if [ai,bi] intersects S is not an empty set. Design an efficient algorithm
for finding a minimum cardinality set of visit times that covers all tasks
=end
# Approach 1: Find largest # disjoint intervals
# sort array of interval based on the left end. Start count from the first element
class Interval
	attr_accessor(:left, :right)
	def initialize(left, right)
		@left = left
		@right = right
	end
	
	def <=>(other)
		@right <=> other.right
	end
end

def visit_tasks(arr)
	return if arr.length < 2
	arr.sort!
	res = Array.new
	target = arr[0]
	count = 0
	1.upto(arr.length-1) do |i|
		if arr[i].left > target.right
			count += 1
			target = arr[i]
		end
	end
	return count + 1
end

arr = [Interval.new(0,3), Interval.new(5,7),
			 Interval.new(9,11), Interval.new(12,14),
			 Interval.new(1,1), Interval.new(3,4),
			 Interval.new(7,8), Interval.new(12,16),
			 Interval.new(2,4), Interval.new(8,11),
			 Interval.new(13,15), Interval.new(16,17)]
puts visit_tasks(arr)