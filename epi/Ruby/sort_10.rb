=begin
Implement Counting Sort
You are given an array of n Person objects. Each Person object has a field key. Rearrange the
elements of the array so that Person objects with equal keys appear together. The order in
which distinct keys appear is not important. Your algorithm must run in O(n) time and O(m)
space, where m is number of distinct entries. How would your solution change if keys have to
appear in sorted order?
=end
class Person
	attr_accessor(:key, :name)
	def initialize(name, key)
		@key = key
		@name = name
	end
end

def counting_sort(arr)
	hash = Hash.new(0)
	arr.each do |person|
		hash[person
	end
end
