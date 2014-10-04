=begin
Find kth smallest element in 2 sorted array
=end

def find_kth_smallest(a, b, k)
	# goal: find x such that x elements in a and (k - x) elements in b
	# are smallest numbers in two array
	# Doing it by binary search on an interval (l, u)
	# where l is the lower bound and u is the upper bound of x
	l = [0, k - b.length].max
	u = [a.length, k].min
	until l > u
		x = (l + u) / 2
		if k - x - 1 >= 0 && x <= a.length - 1 \
			&& k - x <= b.length && a[x] < b[k - x - 1]
			l = x + 1
		elsif x - 1 >= 0 && k - x >= 0 && \
			k - x <= b.length - 1 && a[x - 1] > b[k - x]
			u = x - 1
		else
			result = []
			result << a[x - 1] if x > 0
			result << b[k - x - 1] if x <= k - 1
			return result.max
		end
	end
end

a = [1, 3, 5, 7, 9]
b = [2, 4, 6, 8, 10]
a1 = [8, 9, 10]
b1 = [1, 2, 3, 5]
puts find_kth_smallest(a1, b1, 6)