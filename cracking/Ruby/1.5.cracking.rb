=begin
write a method to replace all spaces in a string with '%20'
=end

def replace(str)
	count = 0
	str.each_char do |char|
		count += 1 if char == ' '
	end
	index = str.length - 1
	str += " " * 2 * count
	runner = str.length - 1
	index.downto(0).each do |i|
		if str[i] == ' '
			str[runner] = '0'
			str[runner - 1] = '2'
			str[runner - 2] = '%'
			runner -= 3
		else
			str[runner] = str[i]
			runner -= 1
		end
	end
	str
end

str = 'haha hoho hehe'
puts replace(str)