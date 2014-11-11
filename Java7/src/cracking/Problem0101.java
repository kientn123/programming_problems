package cracking;
import java.util.*;

/**
 * Implement an algorithm to determine if a string has all unique characters. What if you cannot use
 * additional data structures?
 * @author kiennguyen
 *
 */
public class Problem0101 {

	public static void main(String[] args) {
		System.out.println(isUnique("implement"));
		System.out.println(isUniqueV2("implement"));
		System.out.println(isUnique("Unique"));
		System.out.println(isUniqueV2("anique"));
		System.out.println(isUniqueV2("We"));
	}
	
	/*
	 * With O(q) space where q is the # of unique characters in s
	 * O(n) time where n is the string's length
	 */
	public static boolean isUnique(String s) {
		HashSet<Character> set = new HashSet<>();
		for (int i=0; i<s.length(); i++) {
			if (set.contains(s.charAt(i))) return false;
			set.add(s.charAt(i));
		}
		return true;
	}
	
	/*
	 * With O(1) space. The string should be all lowercase or all uppercase. The reason is because
	 * integer representation is only 32 bits.
	 */
	public static boolean isUniqueV2(String s) {
		if (s.length()==0) return true;
		long sum = 0;
		for (int i=0; i<s.length(); i++) {
			long val = s.charAt(i) - 'a';
			if ((sum & (1 << val)) != 0) return false;
			sum |= (1 << val);
		}
		return true;
	}
}
