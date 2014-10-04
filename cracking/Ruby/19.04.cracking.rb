=begin
Find the max of two number without using if-else
=end

def max(a, b)
	c = a - b
	k = (c >> 31) & 0x1
	a - k * c
end

def min(a, b)
	c = a - b
	k = (c >> 31)
	a - (k+1) * c
end

puts max(4, 6)
puts min(4, 6)