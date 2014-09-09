=begin
Find the max of two number without using if-else
=end

def max(a, b)
	c = a - b
	k = (c >> 31) & 0x1
	a - k * c
end

puts max(4, 6)