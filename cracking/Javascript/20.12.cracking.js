/**
Given an NxN matrix of positive and negative integers, find the submatrix
with the largest possible sum
Dynamic programming
*/

function makeSumMatrix(matrix) {
	if (matrix.length == 0 || matrix[0].length == 0) {
		return "invalid matrix";
	}
	var toReturn = [], i=0, j=0;
	for (i=0; i<matrix.length; i++) {
		toReturn[i] = [];
	}
	for (i=0; i<matrix.length; i++) {
		for (j=0; j<matrix[0].length; j++) {
			toReturn[i][j] = matrix[i][j];
			if (toReturn[i][j-1] != undefined) {
				toReturn[i][j] += toReturn[i][j-1];
			}
			if (toReturn[i-1] != undefined) {
				toReturn[i][j] += toReturn[i-1][j];
			  if (toReturn[i-1][j-1] != undefined) {
					toReturn[i][j] -= toReturn[i-1][j-1];
				}
			}
		}
	}
	return toReturn;
}

function calculate(sumMatrix, x1, x2, y1, y2) {
	var sum = sumMatrix[x2][y2];
	if (x1 != -1) {
		sum -= sumMatrix[x1][y2];
	} 
	if (y1 != -1) {
		sum -= sumMatrix[x2][y1];
	}
	if (x1 != -1 && y1 != -1) {
		sum += sumMatrix[x1][y1]
	}
	return sum;
}

function findMaxSum(matrix) {
	if (matrix.length == 0 || matrix[0].length == 0) {
		return "invalid matrix";
	}
	var maxSum, xNorthWest, yNorthWest, xSouthEast, ySouthEast, sum,
			x1, x2, y1, y2, sumMatrix;
	sumMatrix = makeSumMatrix(matrix);
	for (x1=-1; x1<matrix[0].length-1; x1++) {
		for (x2=x1+1; x2<matrix[0].length; x2++) {
			for (y1=-1; y1<matrix.length-1; y1++) {
				for (y2=y1+1; y2<matrix.length; y2++) {
					sum = calculate(sumMatrix, x1, x2, y1, y2);
					if (maxSum === undefined || maxSum < sum) {
						maxSum = sum;
						xNorthWest = x1; yNorthWest = y1;
						xSouthEast = x2; ySouthEast = y2;
					}
				}
			}
		}
	}
	return {
		maxSum: maxSum,
		xNorthWest: xNorthWest,
		yNorthWest: yNorthWest,
		xSouthEast: xSouthEast,
		ySouthEast: ySouthEast,
		sumMatrix: sumMatrix
	};
}

var matrix = [[1, 9, 0],
							[3, 6, 2],
							[-1, 3, 8]];
var emptyMatrix = [];
//console.log(findMaxSum(emptyMatrix));
console.log(findMaxSum(matrix));

