package cracking;
import java.util.*;

/**
 * Write a method to decide if two strings are anagrams or not
 * @author kiennguyen
 *
 */
public class Problem0104 {

	public static void main(String[] args) {
		System.out.println(areAnagrams("hashmap", "mpahsah"));
		System.out.println(areAnagrams("hashmap", "hashmaq"));
	}
	
	public static boolean areAnagrams(String s1, String s2) {
		HashMap<Character, Integer> map = new HashMap<>();
		for (int i=0; i<s1.length(); i++) {
			if (map.get(s1.charAt(i))==null) map.put(s1.charAt(i), 0);
			map.put(s1.charAt(i), map.get(s1.charAt(i))+1);
		}
		for (int i=0; i<s2.length(); i++) {
			if (map.get(s2.charAt(i))==null || map.get(s2.charAt(i))==0) return false;
			else map.put(s2.charAt(i), map.get(s2.charAt(i))-1);
		}
		for (Map.Entry<Character, Integer> entry : map.entrySet()) {
			if (entry.getValue()>0) return false;
		}
		return true;
	}
}
