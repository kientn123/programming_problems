=begin
You are required to write a method which takes an anonymous letter L and text from a magazine
M. Your method is to return true if and only if L can be written using M. ie, if a letter
appears k times in L, it must appear at least k times in M.
=end
def is_enough(l, m)
	hash = Hash.new(0)
	l.each_char do |char|
		hash[char] += 1
	end
	
	m.each_char do |char|
		if hash[char] != 0
			hash[char] -= 1
			if hash[char] == 0
				hash.delete(char)
				if hash.length == 0
					return true
				end
			end
		end
	end
	return false
end

l = "hello"
m = "a very random lol hat"
puts is_enough(l, m)