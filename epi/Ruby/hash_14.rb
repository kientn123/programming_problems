=begin
Find the highest affinity pair
Write a function which takes as input the name of a log file and returns a pair of pages which
have the highest affinity. The affinity pair of pages is the number of distinct users who view
both
=end
require 'set'
def highest_affinity(file_name)
	hash = Hash.new
	File.open(file_name, 'r') do |f|
		while line = f.gets
			page, user = line.strip.split(",")
			if hash[page].nil?
				hash[page] = Set.new
			end
			hash[page] << user
		end
	end
	puts hash.to_s
	res = { length: 0, page1: nil, page2: nil }
	keys = hash.keys
	0.upto(keys.length-1) do |i|
		(i+1).upto(keys.length-1) do |j|
			num_users = hash[keys[i]].intersection(hash[keys[j]]).length
			if num_users > res[:length]
				res[:length] = num_users
				res[:page1] = keys[i]
				res[:page2] = keys[j]
			end
		end
	end
	return res
end

puts highest_affinity("13.14.epi.txt")