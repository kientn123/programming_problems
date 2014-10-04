=begin
Write an algorithm such that if an element in an MxN matrix is 0,
its entire row and column is set to 0
=end
def transform(mat)
	return "nothing to do" if mat.length == 0 || mat[0].length == 0
	row = Hash.new(0)
	col = Hash.new(0)
	(0..mat.length - 1).each do |i|
		(0..mat[0].length - 1).each do |j|
			if mat[i][j] == 0
				row[i] = 1
				col[j] = 1
			end
		end
	end

	(0..mat.length - 1).each do |i|
		(0..mat[0].length - 1).each do |j|
			if row[i] == 1 || col[j] == 1  
				mat[i][j] = 0
			end
		end
	end
	mat
end

mat = [[2, 4, 5],
			 [3, 0, 7],
			 [8, 10, 1]]

mat1 = []
mat2 = [[]]
print transform(mat).to_s
puts
print transform(mat1).to_s
puts
print transform(mat2).to_s
puts