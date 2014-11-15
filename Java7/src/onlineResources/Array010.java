package onlineResources;
import java.util.*;

/**
 * Given a positive integer N, count all possible distinct binary strings of length N such that there
 * are no consecutive 1's
 * http://www.geeksforgeeks.org/count-number-binary-strings-without-consecutive-1s/
 * @author kiennguyen
 *
 */
public class Array010 {

	public static void main(String[] args) {
		System.out.println(numBinary(3));
	}
	
	public static int numBinary(int n) {
		if (n<1) return 0;
		int[] endWithOne = new int[n];
		int[] endWithZero = new int[n];
		endWithOne[1] = 1; endWithZero[1] = 1;
		for (int i=2; i<n; i++) {
			endWithOne[i] = endWithZero[i-1];
			endWithZero[i] = endWithZero[i-1] + endWithOne[i-1];
		}
		return endWithOne[n-1]+endWithZero[n-1];
	}
}
