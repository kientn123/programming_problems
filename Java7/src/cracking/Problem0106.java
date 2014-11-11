package cracking;
import java.util.*;

/**
 * Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method
 * to rotate the image by 90 degrees. Can you do this in place?
 * @author kiennguyen
 *
 */
public class Problem0106 {

	public static void main(String[] args) {
		int[][] mat = {{1,2,3,4},
				{5,6,7,8},
				{9,10,11,12},
				{13,14,15,16}};
		int[][] mat2 = {{1,2,3,4,5},
				{6,7,8,9,10},
				{11,12,13,14,15},
				{16,17,18,19,20},
				{21,22,23,24,25}};
		rotate90degrees(mat);
		rotate90degrees(mat2);
		for (int i=0; i<mat.length; i++) {
			System.out.println(Arrays.toString(mat[i]));
		}
		for (int i = 0; i < mat2.length; i++) {
			System.out.println(Arrays.toString(mat2[i]));
		}
	}
	
	public static void rotate90degrees(int[][] mat) {
		if (mat.length==0) return;
		for (int stage=0; stage<mat.length/2; stage++) {
			int begin = stage, end=mat.length-1-stage;
			for (int i=begin; i<end; i++) {
				int temp = mat[begin][i];
				mat[begin][i] = mat[i][end];
				mat[i][end] = mat[end][end-i];
				mat[end][end-i] = mat[end-i][begin];
				mat[end-i][begin] = temp;
			}
		}
	}
}
