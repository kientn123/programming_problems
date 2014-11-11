package cracking;
import java.util.*;

/**
 * Write a method to replace all spaces in a string with '%20'
 * @author kiennguyen
 *
 */
public class Problem0105 {

	public static void main(String[] args) {
		char[] str = {'a','r','r','a','y',' ','a','n','d',' ','s','t','r','i','n','g',
				'\0','\0','\0','\0','\0'};
		replace(str, 16);
		System.out.println(Arrays.toString(str));
	}
	
	public static void replace(char[] str, int length) {
		int numSpaces = 0;
		for (int i=0; i<length; i++) {
			if (str[i]==' ') numSpaces++;
		}
		int newLength = length + numSpaces*2;
		str[newLength--] = '\0';
		for (int i=length-1; i>=0; i--) {
			if (str[i]==' ') {
				str[newLength--] = '0';
				str[newLength--] = '2';
				str[newLength--] = '%';
			} else {
				str[newLength--] = str[i];
			}
		}
	}
}
