=begin 
2 sorted arrays A & B. A has a large enough buffer at the end 
to hold B. Write a method to merge B into A in sorted order
=end

def merge(a, b)
	# a & b are arrays
	# n = a.length & m = b.length
	i = a.length - 1
	j = b.length - 1
	k = a.length + b.length - 1
	while i >= 0 and j >= 0
		if a[i] > b[j]
			a[k] = a[i]
			i -= 1
		else
			a[k] = b[j]
			j -= 1
		end
		k -= 1
	end

	while j >= 0
		a[k] = b[j]
		k -= 1
		j -= 1
	end
	a
end

a = [3, 5, 7, 9, 11]
b = [2, 4, 6, 8, 10]
print merge(a, b)
puts