package onlineResources;
import java.util.*;

/**
 * Find the smallest positive integer value that cannot be represented as sum of any subset of a
 * given array
 * Given a sorted array (nod-decreasing order) of positive numbers, find the smallest positive integer
 * value that cannot be represented as sum of elements of any subset of given set
 * http://www.geeksforgeeks.org/find-smallest-value-represented-sum-subset-given-array/
 * @author kiennguyen
 *
 */
public class Array006 {

	public static void main(String[] args) {
		int[] test1 = {1, 3, 6, 10, 11, 15};
		int[] test2 = {1, 1, 1, 1};
		int[] test3 = {1, 1, 3, 4};
		int[] test4 = {1, 2, 5, 10, 20, 40};
		int[] test5 = {1, 2, 3, 4, 5, 6};
		System.out.println(smallestPositive(test1));
		System.out.println(smallestPositive(test2));
		System.out.println(smallestPositive(test3));
		System.out.println(smallestPositive(test4));
		System.out.println(smallestPositive(test5));
	}

	public static int smallestPositive(int[] arr) {
		if (arr.length == 0 || arr[0] > 1) return -1;
		int sum = arr[0];
		for (int i=1; i<arr.length; i++) {
			if (arr[i] > sum+1) return sum+1;
			sum = sum + arr[i];
		}
		return sum+1;
	}
}
