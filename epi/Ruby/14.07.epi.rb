=begin
Compute the union of intervals
Consider a set of intervals with integer endpoints; the intervals may be open or closed at
either ends. We want to compute the union of such set
=end
class Interval
	attr_accessor(:left, :right, :closed_left, :closed_right)
	def initialize(left, right, closed_left, closed_right)
		@left = left
		@right = right
		@closed_left = closed_left
		@closed_right = closed_right
	end
	
	def <=>(other)
		if @left != other.left
			return @left <=> other.left
		else
			if @closed_left && !other.closed_left
				return -1
			else
				return 1
			end
		end
	end
	
	def to_s
		left_paren = @closed_left ? "[" : "("
		right_paren = @closed_right ? "]" : ")"
		return left_paren + @left.to_s + ", " + @right.to_s + right_paren
	end
end

def union(arr)
	return if arr.length < 2
	res = Array.new
	arr.sort!
	arr.each do |interval|
		puts interval.to_s
	end
	target = arr[0]
	runner = 1
	while runner < arr.length
		puts "target: " + target.to_s
		puts "runner: " + arr[runner].to_s
		if (target.right < arr[runner].left) || (target.right == arr[runner].left && \
			!(target.closed_right || arr[runner].closed_left))
			res << target
			target = arr[runner]
		else
			if target.right < arr[runner].right
				target.right = arr[runner].right
				target.closed_right = arr[runner].closed_right
			elsif target.right == arr[runner].right
				target.closed_right = target.closed_right || arr[runner].closed_right
			end
		end
		
		runner += 1
	end
	
	res << target
	return res
end

arr = [Interval.new(0,3,false,false), Interval.new(5,7,true,false),
			 Interval.new(9,11,false,true), Interval.new(12,14,true,true),
			 Interval.new(1,1,true,true), Interval.new(3,4,true,false),
			 Interval.new(7,8,true,false), Interval.new(12,16,false,true),
			 Interval.new(2,4,true,true), Interval.new(8,11,true,false),
			 Interval.new(13,15,false,false), Interval.new(16,17,false,false)]
res = union(arr)
res.each do |interval|
	puts interval.to_s
end