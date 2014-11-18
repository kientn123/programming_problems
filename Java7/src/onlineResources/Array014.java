package onlineResources;

import java.util.ArrayList;

/**
 * Write a program to print all the LEADERS in the array. An element is leader if it is greater than all
 * the elements to its right side. And the right most element is always a leader.
 * @author kiennguyen
 *
 */
public class Array014 {

	public static void main(String[] args) {
		int[] test = {16,17,4,3,5,2};
		System.out.println(leaders(test));
	}
	
	public static ArrayList<Integer> leaders(int[] arr) {
		ArrayList<Integer> res = new ArrayList<>();
		int max = Integer.MIN_VALUE;
		for (int i=arr.length-1; i>=0; i--) {
			if (arr[i] > max) {
				res.add(arr[i]);
				max = arr[i];
			}
		}
		return res;
	}
}
