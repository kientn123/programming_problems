package onlineResources;

/**
 * Check for majority element in a sorted array
 * Write a function isMajority() which takes an array and an element and returns true if x is the
 * majority element, false otherwise
 * http://www.geeksforgeeks.org/check-for-majority-element-in-a-sorted-array/
 * @author kiennguyen
 *
 */
public class Array016 {

	public static void main(String[] args) {
		int[] test = {1, 2, 3, 3, 3, 3, 10};
		int[] test2 = {1, 1, 2, 4, 4, 4, 6, 6};
		System.out.println(isMajority(test, 3));
		System.out.println(isMajority(test2, 4));
	}
	
	public static boolean isMajority(int[] arr, int x) {
		int index = binarysearch(arr, x);
		return index > -1 && index < arr.length && arr[index+ arr.length/2]==x;
	}

	private static int binarysearch(int[] arr, int x) {
		int left=0, right=arr.length-1;
		int res = -1;
		while (left <= right) {
			int mid = (left + right)/2;
			if (arr[mid]==x) {
				res = mid;
				right = mid-1;
			} else if (arr[mid]>x) {
				right = mid-1;
			} else {
				left = mid+1;
			}
		}
		return res;
	}
}
