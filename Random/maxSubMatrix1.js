/*
Given a binary matrix, find out the maximum size square sub-matrix with all 1's
*/

function maxSubMatrix(matrix) {
	if (matrix.length == 0 || matrix[0].length == 0) {
		return "invalid matrix";
	}
	var count = [];
	for (var i=0; i<matrix.length; i++) {
		count[i] = [];
		if (i==0) {
			for (var j=0; j<matrix[0].length; j++) {
				count[i][j] = matrix[i][j];
			}
		}
		count[i][0] = matrix[i][0];
	}
	for (i=1; i<matrix.length; i++) {
		for (var j=1; j<matrix[0].length; j++) {
			if (matrix[i][j] == 1) {
				count[i][j] = Math.min(count[i][j-1], count[i-1][j], count[i-1][j-1]) + 1;
			} else {
				count[i][j] = 0;
			}
		}
	}
	return getMaxMatrix(count);
}

function getMaxMatrix(matrix) {
	var max = matrix[0][0];
	var iPos = 0;
	var jPos = 0;
	for (var i=0; i<matrix.length; i++) {
		for (var j=0; j<matrix[0].length; j++) {
			if (matrix[i][j] > max) {
				max = matrix[i][j];
				iPos = i; jPos = j;
			}
		}
	}
	return {
		max: max, iPos: iPos, jPos: jPos, matrix: matrix
	}
}

function getMaxOfArray(numArray) {
	return Math.max.apply(null, numArray);
}

var a = [[0,1,1,0,1],
				 [1,1,0,1,0],
				 [0,1,1,1,0],
				 [1,1,1,1,0],
				 [1,1,1,1,1],
				 [0,0,0,0,0]];
console.log(maxSubMatrix(a));