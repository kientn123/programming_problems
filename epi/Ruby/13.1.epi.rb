=begin
Funtion takes as input a set of words and prints groups a anagrams for those word
=end
require 'set'

def anagrams(set)
	hash = Hash.new
	set.each do |str|
		sorted_one = str.chars.sort.join
		hash[sorted_one] = Array.new if hash[sorted_one].nil?
		hash[sorted_one] << str
	end

	hash.each do |key, value|
		if value.length >= 2
			to_print = ""
			value.each do |word|
				to_print << word + ", "
			end
			puts to_print.strip
		end
	end
end

set = Set.new(['hahaha', 'ahahah', 'hoho', 'ohoh', 'hello', 'hey'])
anagrams(set)