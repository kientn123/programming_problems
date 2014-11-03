package onlineResources;
import java.util.*;

/**
 * Find common elements in non-decreasing order, print all common elements in these arrays
 * http://www.geeksforgeeks.org/find-common-elements-three-sorted-arrays/
 * @author kiennguyen
 *
 */
public class Array003 {

	public static void main(String[] args) {
		int[] test1 = {1,5,10,20,40,80};
		int[] test2 = {6,7,20,80,100};
		int[] test3 = {3,4,15,20,30,70,80,120};
		int[] test4 = {1,5,5};
		int[] test5 = {3,4,5,5,10};
		int[] test6 = {5,5,10,20};
		System.out.println(common(test1, test2, test3));
		System.out.println(common(test4, test5, test6));
	}
	
	public static ArrayList<Integer> common(int[] a, int[] b, int[] c) {
		if (a.length == 0 || b.length==0 || c.length==0) return null;
		int a1=0, b1=0, c1=0;
		ArrayList<Integer> res = new ArrayList<Integer>();
		while (a1<a.length && b1<b.length && c1<c.length) {
			if (a[a1]==b[b1] && b[b1]==c[c1]) {
				res.add(a[a1]);
				a1++; b1++; c1++;
			} else {
				int max = Math.max(Math.max(a[a1], b[b1]), c[c1]);
				if (a[a1] < max) a1++;
				if (b[b1] < max) b1++;
				if (c[c1] < max) c1++;
			}
		}
		
		return res;
	}
}
