=begin
Count the frequencies of characters in a sentence
Given a string s, print in alphabetical order each character that appears in s, and the number
of times that it appears.
=end
# O(nlogn) time and O(1) space
def count_characters(str)
	str = str.chars.sort.join
	count = 1
	1.upto(str.length-1) do |i|
		if str[i] == str[i-1]
			count += 1
		else
			puts "(" + str[i-1] + "; " + count.to_s + ")"
			count = 1
		end
	end
	puts "(" + str[-1] + "; " + count.to_s + ")"
end

# O(n) time and O(1) space
def count_characters_v2(str)
	count = Array.new(26, 0)
	str.each_char do |char|
		count[char.ord - "a".ord] += 1
	end	
	0.upto(count.length-1) do |i|
		puts "(" + ("a".ord + i).chr + "; " + count[i].to_s + ")" if count[i] > 0
	end
end

s = "bcdacebe"
count_characters(s)
count_characters_v2(s)