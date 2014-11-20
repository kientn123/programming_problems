package onlineResources;

/**
 * Count the number of occurrences in a sorted array
 * Given a sorted array arr and a number x, write a function that counts the occurrences of x in arr.
 * Expected time complexity O(logn)
 * http://www.geeksforgeeks.org/count-number-of-occurrences-in-a-sorted-array/
 * @author kiennguyen
 *
 */
public class Array017 {

	public static void main(String[] args) {
		int[] test = {1, 1, 2, 2, 2, 2, 3};
		int[] test2 = {1, 1, 2, 2, 2, 2, 3};
		System.out.println(occurrences(test, 2));
		System.out.println(occurrences(test2, 4));
	}
	
	public static int occurrences(int[] arr, int x) {
		int first = binaryFirstOccur(arr, x);
		int last = binaryLastOccur(arr, x);
		return first == -1 ? 0 : last - first + 1;
	}
	
	private static int binaryLastOccur(int[] arr, int x) {
		if (arr.length == 0) return -1;
		int res = -1;
		int left = 0, right = arr.length - 1;
		while (left <= right) {
			int mid = (left+right)/2;
			if (arr[mid]==x) {
				res = mid;
				left = mid + 1;
			} else if (arr[mid]>x) {
				right = mid - 1;
			} else {
				left = mid + 1;
			}
		}
		return res;
	}

	public static int binaryFirstOccur(int[] arr, int x) {
		if (arr.length == 0) return -1;
		int res = -1;
		int left = 0, right = arr.length - 1;
		while (left <= right) {
			int mid = (left+right)/2;
			if (arr[mid]==x) {
				res = mid;
				right = mid - 1;
			} else if (arr[mid]>x) {
				right = mid - 1;
			} else {
				left = mid + 1;
			}
		}
		return res;
	}
}
