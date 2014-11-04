package onlineResources;
import java.util.*;

/**
 * Given two sorted arrays such the arrays may have some common elements. Find the sum of the maximum
 * sum path to reach from beginning of any array to end of any of the two arrays. We can switch from one
 * array to another array only at common elements.
 * http://www.geeksforgeeks.org/maximum-sum-path-across-two-arrays/
 * @author kiennguyen
 *
 */
public class Array008 {

	public static void main(String[] args) {
		int[] test1 = {2, 3, 7, 10, 12, 15, 30, 34};
		int[] test2 = {1, 5, 7, 8, 10, 15, 16, 19};
		System.out.println(maxSumPath(test1, test2));
		int[] test3 = {2, 3, 7, 10, 12};
		int[] test4 = {1, 5, 7, 8};
		System.out.println(maxSumPath(test3, test4));
	}
	
	public static int maxSumPath(int[] arr, int[] brr) {
		if (arr.length<0 || brr.length<0) return -1;
		int arunner = 0, brunner=0, suma = 0, sumb = 0, sum=0;
		while (arunner<arr.length && brunner<brr.length) {
			if (arr[arunner] < brr[brunner]) suma += arr[arunner++];
			else if (arr[arunner] > brr[brunner]) sumb += brr[brunner++];
			else {
				sum += Math.max(suma, sumb);
				suma = arr[arunner++]; sumb = brr[brunner++];
			}
		}
		
		while (arunner<arr.length) suma += arr[arunner++];
		while (brunner<brr.length) sumb += brr[brunner++];
		return sum + Math.max(suma, sumb);
	}
}
