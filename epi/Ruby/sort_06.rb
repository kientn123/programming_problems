=begin
Add a closed interval
Write a function which takes as input an array A of disjoint closed intervals with integer
endpoints, sorted by increasing order of left endpoint, and an interval I, and returns the
union of I with the intervals in A, expressed as the union of disjoint intervals.
=end
class Interval
	attr_accessor(:start_point, :end_point)
	def initialize(start_point, end_point)
		@start_point = start_point
		@end_point = end_point
	end
	
	def to_s
		"(" + @start_point.to_s + ", " + @end_point.to_s + ")"
	end
end

def union(arr, an_interval)
	res = Array.new
	overlap = Interval.new(an_interval.start_point, an_interval.end_point)
	i = 0
	while i < arr.length && arr[i].end_point < an_interval.start_point
		res << arr[i]
		i += 1
	end
	
	while i < arr.length && arr[i].start_point <= an_interval.end_point
		overlap.start_point = [overlap.start_point, arr[i].start_point].min
		overlap.end_point = [overlap.end_point, arr[i].end_point].max
		i += 1
	end
	
	res << overlap
	while i < arr.length
		res << arr[i]
		i += 1
	end
	
	return res
end

arr = [Interval.new(0,2), Interval.new(3,6), Interval.new(7,7), Interval.new(9,12)]
puts union(arr, Interval.new(1,8)).to_s