package onlineResources;
import java.util.*;

/**
 * Given an array of integers, find the first repeating element in it. We need to find the element that
 * occurs more than once and whose index of the first occurrence is smallest.
 * http://www.geeksforgeeks.org/find-first-repeating-element-array-integers/
 * @author kiennguyen
 *
 */
public class Array004 {

	public static void main(String[] args) {
		int[] test1 = {10,5,3,43,5,6};
		int[] test2 = {6,10,5,4,9,120,4,6,10};
		System.out.println(repeatingElement(test1));
		System.out.println(repeatingElement(test2));
	}
	
	public static int repeatingElement(int[] arr) {
		if (arr.length == 0) return -1;
		int res = -1;
		HashSet<Integer> set = new HashSet<>();
		for (int i=arr.length-1; i>=0; i--) {
			if (set.contains(arr[i])) res = i;
			else set.add(arr[i]);
		}
		
		return arr[res]; 
	}
}
