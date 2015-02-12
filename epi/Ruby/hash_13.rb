=begin
Write a function which takes as input a string s and a list l of equal length strings, and
returns all substrings of s which are the concatenation of all the strings in l. Each string
in l must appear exactly once, and the ordering is immaterial.
=end
def get_concatenations(s, l)
	# Assume valid inputs
	res = []
	i = 0
	while i + l.length * l[0].length - 1 < s.length
		if is_concatenation(s, i, l)
			res << s[i..i + l.length * l[0].length - 1]
		end
		i += 1
	end
	return res.to_s
end

def is_concatenation(s, start, l)
	hash = Hash.new
	l.each do |word|
		hash[word] = true
	end
	# puts hash.to_s
	i = start
	l.length.times do
		# puts "examining: " + s[i..i+l[0].length-1]
		if hash[s[i..i+l[0].length-1]]
			hash.delete(s[i..i+l[0].length-1])
			i += l[0].length
			# puts i
			# puts hash.to_s
		else
			return false
		end
	end
	return true
end

l = ["can", "apl", "ana"]
s = "amanaplanacanal"
puts get_concatenations(s, l)
puts is_concatenation("aplanacan", 0, l)