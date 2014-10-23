=begin
Let s be an array of strings. Write a function which finds the distance of any closest pair
of equal entries
=end
def closest_pair(arr)
	return if arr.length == 0
	most_recent = Hash.new()
	res = { distance: Float::INFINITY, word: nil }
	0.upto(arr.length-1) do |i|
		puts "#{arr[i]} most recent is #{most_recent[arr[i]]}"
		if most_recent[arr[i]]
			puts "#{arr[i]} most recent is #{most_recent[arr[i]]}"
			distance = i - most_recent[arr[i]]
			if distance < res[:distance]
				res[:distance] = distance
				res[:word] = arr[i]
			end
		end
		most_recent[arr[i]] = i
	end
	return res
end

arr = ["All", "work", "and", "no", "play", "makes", "for", "no",
			"work", "no", "fun", "no", "results"]
puts closest_pair(arr)