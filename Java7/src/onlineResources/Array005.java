package onlineResources;
import java.util.*;

/**
 * Search in an almost sorted array
 * Given an array which is sorted, but after sorting some elements are moved to either of the adjacent
 * position, i.e., arr[i] may be present at arr[i+1] or arr[i-1]. Write an efficient algorithm to search
 * an element in this array. Basically the element arr[i] can only be swapped with either arr[i+1] or
 * arr[i-1]
 * For example: consider {10,3,40,20,50,80,70}, 3 & 10 are swapped, 80 and 70 are swapped.
 * @author kiennguyen
 *
 */
public class Array005 {

	public static void main(String[] args) {
		int[] test1 = {10,3,40,20,50,80,70};
		System.out.println(modifiedBinarySearch(test1, 40));
		System.out.println(modifiedBinarySearch(test1, 90));
	}
	
	public static int modifiedBinarySearch(int[] arr, int key) {
		int left = 0, right = arr.length-1;
		while (left <= right) {
			int mid = (left + right) / 2;
			if (arr[mid] == key) return mid;
			if (mid > left && arr[mid-1] == key) return mid-1;
			if (mid < right && arr[mid+1] == key) return mid+1;
			if (key < arr[mid]) {
				right = mid-2;
			} else {
				left = mid+2;
			}
		}
		return -1;
	}
}
