=begin
Given a matrix in which each row and each column is sorted, write a method
to find a element in it
=end

def find_element(mat, x)
	# Assumptions:
	# each row is sorted ascending order from left to right
	# each column is sorted ascending order from top to bottom
	row = 0
	col = mat[0].length - 1
	while row <= mat.length - 1 and col >= 0
		if x == mat[row][col]
			return [row, col]
		elsif x > mat[row][col]
			row += 1
		else
			col -= 1
		end
	end
	[-1, -1]
end

mat = [ [1, 3, 5, 7, 9],
				[2, 4, 6, 8, 10],
				[11, 15, 17, 20, 21]]


print find_element(mat, 12)
puts