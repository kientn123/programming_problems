=begin
Implement a function for reversing the words in a string s.
Your function should use O(1) space
=end

def reverse_words(str)
	reverse_string(str, 0, str.length - 1)
	start = 0
	while true
		space_index = str.index(' ', start)
		break if space_index.nil?
		reverse_string(str, start, space_index - 1)
		start = space_index + 1 
	end
	reverse_string(str, start, str.length - 1)
end

def reverse_string(str, start, finish)
	mid = (start + finish)/2
	start.upto(mid) do |i|
		index = i - start
		str[i], str[finish - index] = str[finish - index], str[i]
	end 
end

str = 'hello how are you'
reverse_words(str)
puts str