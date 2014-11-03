package onlineResources;
import java.util.*;

/**
 * Given an array of positive and negative numbers, arrange them in an alternate fashion such that every
 * negative number is followed by positive and vice-versa, maintaining the order of appearances (start
 * off with a negative if we have at least a negative)
 * @author kiennguyen
 *
 */
public class Array007 {

	public static void main(String[] args) {
		int[] test1 = {1, 2, 3, -4, -1, 4};
		int[] test2 = {-5, -2, 5, 2, 4, 7, 1, 8, 1, -8};
		rearrange(test1); rearrange(test2);
		System.out.println(Arrays.toString(test1));
		System.out.println(Arrays.toString(test2));
	}
	
	public static void rearrange(int[] arr) {
		if (arr.length == 0) return;
		int cur = 0, runner = 0;
		while (runner < arr.length) {
			if ((cur&1) == 0) {
				while (runner<arr.length && arr[runner]>0) runner++;
				if (runner<arr.length) {
					swap(arr, cur, runner);
					cur++;
				}
			} else {// curr is odd
				while (runner<arr.length && arr[runner]<0) runner++;
				if (runner<arr.length) {
					swap(arr, cur, runner);
					cur++;
				}
			}
		}
	}
	
	public static void swap(int[] arr, int i, int j) {
		if (i != j) {
			int temp = arr[i];
			arr[i] = arr[j];
			arr[j] = temp;
		}
	}

}
