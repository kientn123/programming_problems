=begin
Render a calendar
Given a set of n events, how would you determine the maximum number of events that takes place
concurrently
=end
class Interval
	attr_accessor(:start_point, :end_point)
	def initialize(start_point, end_point)
		@start_point = Point.new(start_point, is_start=true)
		@end_point = Point.new(end_point, is_start=false)
	end
end

class Point
	attr_accessor(:time, :is_start)
	def initialize(time, is_start)
		@time = time
		@is_start = is_start
	end
end

def max_concurrent_events(arr)
	times = Array.new
	arr.each do |interval|
		times << interval.start_point
		times << interval.end_point
	end
	
	times.sort! do |a, b|
		a.time <=> b.time
	end
	
	max_count = 0
	count = 0
	0.upto(times.length-1) do |i|
		if times[i].is_start
			count += 1
			if count > max_count
				max_count = count
			end
		else
			count -= 1
		end	
	end
	return max_count
end

arr = [Interval.new(1,5), Interval.new(6,10), Interval.new(11,13), Interval.new(14,15),
			 Interval.new(2,7), Interval.new(8,9), Interval.new(12,15), Interval.new(4,5),
			 Interval.new(9,17)]
			 
puts max_concurrent_events(arr)