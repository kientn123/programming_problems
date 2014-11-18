package onlineResources;
import java.util.*;

/**
 * Given an array of positive numbers, find the maximum sum of a subsequence with the constraint that
 * no 2 numbers in the sequence should be adjacent in the array.
 * http://www.geeksforgeeks.org/maximum-sum-such-that-no-two-elements-are-adjacent/
 * @author kiennguyen
 *
 */
public class Array013 {

	public static void main(String[] args) {
		int[] test1 = {3,2,7,10};
		int[] test2 = {3,2,5,10,7};
		System.out.println(maxSum(test1));
		System.out.println(maxSum(test2));
	}
	
	public static int maxSum(int[] arr) {
		// Kind of dynamic programming (bottom up)
		int inclusive = 0, exclusive = 0;
		for (int i=0; i<arr.length; i++) {
			int temp = inclusive;
			inclusive = exclusive + arr[i];
			exclusive = Math.max(exclusive, temp);
		}
		return Math.max(inclusive, exclusive);
	}
}
