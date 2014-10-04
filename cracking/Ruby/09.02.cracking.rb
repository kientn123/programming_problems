=begin
sort an array of strings so that all the anagrams are next to each other
=end

def sort(arr)
	arr.sort do |a, b|
		_a = a.chars.sort.join
		_b = b.chars.sort.join
		_a <=> _b
	end
end

arr = ['ad', 'da', 'bc']
sort(arr)
print arr
puts