package onlineResources;

import java.util.*;

/**
 * Given nxn square matrix, find sum of all sub-squares of size kxk where k is less than or equal to n
 * http://www.geeksforgeeks.org/given-n-x-n-square-matrix-find-sum-sub-squares-size-k-x-k/
 * @author kiennguyen
 *
 */
public class Array002 {

	public static void main(String[] args) {
		int[][] test = {{1,1,1,1,1},
				{2,2,2,2,2},
				{3,3,3,3,3},
				{4,4,4,4,4},
				{5,5,5,5,5}};
		int[][] test2 = {{1,2,3},
				{4,5,6},
				{7,8,9}};
		int[][] res = subsquares(test, 3);
		for (int i=0; i<res.length; i++) {
			System.out.println(Arrays.toString(res[i]));
		}
		int[][] res2 = subsquares(test2, 2);
		for (int i=0; i<res2.length; i++) {
			System.out.println(Arrays.toString(res2[i]));
		}
	}
	
	public static int[][] subsquares(int[][] mat, int k) {
		if (mat.length == 0) return null;
		int[][] intermediate = new int[mat.length][mat.length-k+1];
		for (int i=0; i<mat.length; i++) {
			int sum = 0;
			for (int j=0; j<k; j++) sum += mat[i][j];
			intermediate[i][0] = sum;
			for (int j=1; j<mat.length-k+1; j++) {
				sum = sum + mat[i][j+k-1] - mat[i][j-1];
				intermediate[i][j] = sum;
			}
		}
		
		int[][] res = new int[mat.length-k+1][mat.length-k+1];
		for (int i=0; i<mat.length-k+1; i++) {
			int sum = 0;
			for (int j=0; j<k; j++) sum += intermediate[j][i];
			res[0][i] = sum;
			for (int j=1; j<mat.length-k+1; j++) {
				sum = sum + intermediate[j+k-1][i] - intermediate[j-1][i];
				res[j][i] = sum;
			}
		}
		
		return res;
	}
}
