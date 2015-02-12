=begin
Test for permutation of palindrome
=end
def is_permutation_of_palindrome(s)
	hash = Hash.new(0)
	s.each_char do |char|
		hash[char] += 1
	end
	puts hash.to_s
	odd_count = 0
	hash.each do |k,v|
		if (v&1) == 1
			odd_count += 1
			if odd_count > 1
				return false
			end
		end
	end
	return true
end

puts is_permutation_of_palindrome("palinlpai")