=begin
Implement merge sort in place
Write a function which takes input as 2 sorted arrays of integers, A and B, and update A to be
the combined entries of A and B in sorted order. Assume A has enough empty entries at its
end to hold the result
=end
def merge_sort_in_place(a, b)
	runner = a.length + b.length - 1
	i = a.length - 1
	j = b.length - 1
	while i >= 0 && j >= 0
		if a[i] > b[j] 
			a[runner] = a[i]
			i -= 1
		else
			a[runner] = b[j]
			j -= 1
		end
		runner -= 1
	end
	
	while j >= 0
		a[runner] = b[j]
		j -= 1
		runner -= 1
	end
end

a = [1,3,4,6]
b = [0,4,4]
merge_sort_in_place(a, b)
puts a.to_s