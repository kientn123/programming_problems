=begin
Assume you have one method isSubstring which checks if one word is a substring of
another. Given two string, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring
=end 

def is_rotation(s1, s2)
	s1 = s1 + s1
	if s1.include? s2
		true
	else
		false
	end
end

s1 = 'waterbottle'; s2 = 'erbottlewat'
t1 = 'cracking'; t2 = 'ckingcrb'

puts is_rotation(s1, s2)
puts is_rotation(t1, t2)