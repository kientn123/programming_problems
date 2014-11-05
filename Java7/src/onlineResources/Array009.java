package onlineResources;
import java.util.*;

/**
 * Given an array of n numbers and another number x, determine whether or not there exist two elements
 * i S whose sum is exactly x
 * @author kiennguyen
 *
 */
public class Array009 {

	public static void main(String[] args) {
		int[] test = {1, 4, 45, 6, 10, -8};
		System.out.println(determine(test, 16));
	}
	
	public static boolean determine(int[] arr, int x) {
		if (arr.length==0) return false;
		Arrays.sort(arr);
		int left=0, right=arr.length-1;
		while (left <= right) {
			if (arr[left]+arr[right]<x) left++;
			else if (arr[left]+arr[right]>x) right--;
			else return true;
		}
		
		return false;
 	}

}
