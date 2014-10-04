=begin
Write a function to swap a number in place without temporary variables
=end

def swap(a, b)
	a = a - b
	b = b + a
	a = b - a
	puts "a: #{a}, b: #{b}"
end

swap(4, 5)