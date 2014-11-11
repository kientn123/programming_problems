package cracking;
import java.util.*;

/**
 * Design an algorithm and write code to remove the duplicate characters in a stirng without using
 * additional buffer
 * @author kiennguyen
 *
 */
public class Problem0103 {

	public static void main(String[] args) {
		char[] chars = {'a','d','d','i','t','i','o','n','a','l'};
		removeDuplicates(chars);
		System.out.println(Arrays.toString(chars));
	}
	
	public static void removeDuplicates(char[] str) {
		if (str.length == 0) return;
		int runner = 0, cur = 0;
		while (runner < str.length) {
			int i=0;
			while (i<cur) {
				if (str[i]==str[runner]) break;
				i++;
			}
			if (i==cur) {
				str[cur++] = str[runner];
			}
			runner++;
		}
		while (cur<str.length) {
			str[cur++] = '\0';
		}
	}
}
