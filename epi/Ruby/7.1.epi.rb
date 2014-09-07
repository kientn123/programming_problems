=begin
Implement string/integer inter-conversion functions
=end

def int_to_string(int)
	to_return = ''
	is_negative = false
	if int < 0
		int = -int
		is_negative = true
	end
	while int != 0
		to_return = (int%10).to_s + to_return
		int /= 10
	end
	to_return = '-' + to_return if is_negative
	to_return
end

def string_to_int(str)
	to_return = 0
	str.each_char do |c|
		to_return = to_return * 10 + c.ord - '0'.ord
	end
	to_return
end

str = '352624634'
int = 22373768
puts int_to_string(int)
puts string_to_int(str)