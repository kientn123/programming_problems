=begin
Given an image represented by NxN matrix, where each pixel in the image is 4
bytes, write a method to rotate the image by 90 degrees. 
Can you do this in place?
=end

def rotate(mat)
	return 'nothing to do' if mat.length == 0 \
		|| mat[0].length == 0 || mat.length != mat[0].length
	n = mat.length
	(0..n/2).each do |i|
		(i..n - 2 - i).each do |j|
			mat[i][j], mat[n-1-j][i], mat[n-1-i][n-1-j], mat[j][n-1-i] = \
				mat[n-1-j][i], mat[n-1-i][n-1-j], mat[j][n-1-i], mat[i][j]
		end
	end
	mat
end

mat = [[2, 4, 5],
			 [3, 0, 7],
			 [8, 10, 1]]
print rotate(mat).to_s
puts