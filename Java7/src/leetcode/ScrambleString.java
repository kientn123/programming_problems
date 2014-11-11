package leetcode;

public class ScrambleString {

	public static void main(String[] args) {
		System.out.println(isScramble("abab", "baba"));
		String s = "abab";
		System.out.println(s.substring(2));
	}
	
	public static boolean isScramble(String s1, String s2) {
        if (s1.length() != s2.length()) return false;
        if (s1.length() == 1) return s1.equals(s2);
        if (s1.length() == 2) return (s1.charAt(0)==s2.charAt(1) && s1.charAt(1)==s2.charAt(0)) || s1.equals(s2);
        if (s2.length() == 3) {
            return (s1.charAt(0)==s2.charAt(0) && isScramble(s1.substring(1), s2.substring(1))) ||
                (s1.charAt(0)==s2.charAt(2) && isScramble(s1.substring(1), s2.substring(0,2))) ||
                (s1.charAt(2)==s2.charAt(0) && isScramble(s1.substring(0,2), s2.substring(1))) ||
                (s1.charAt(2)==s2.charAt(2) && isScramble(s1.substring(0,2), s2.substring(0,2)));
        }
        int mid = s1.length() / 2;
        System.out.println("length: "+s1.length());
        System.out.println("mid: "+mid);
        System.out.println("s1 first half: "+s1.substring(0,mid));
        System.out.println("s1 second half: "+s1.substring(mid));
        System.out.println("s2 first half: "+s1.substring(0,mid));
        System.out.println("s2 second half: "+s1.substring(mid));

        if (s1.length() % 2 == 0) {
            return (isScramble(s1.substring(0,mid), s2.substring(0,mid)) &&
                isScramble(s1.substring(mid), s2.substring(mid))) ||
                (isScramble(s1.substring(0,mid), s2.substring(mid)) &&
                isScramble(s1.substring(mid), s2.substring(0,mid)));
        } else {
            return (isScramble(s1.substring(0,mid+1), s2.substring(0,mid)) &&
                isScramble(s1.substring(mid+1), s2.substring(0,mid))) ||
                (isScramble(s1.substring(0,mid+1), s2.substring(0,mid+1)) &&
                isScramble(s1.substring(mid+1), s2.substring(mid+1))) ||
                (isScramble(s1.substring(0,mid), s2.substring(mid)) &&
                isScramble(s1.substring(mid), s2.substring(0,mid))) ||
                (isScramble(s1.substring(mid), s2.substring(mid)) &&
                isScramble(s1.substring(0,mid), s2.substring(0,mid)));
        }
    }
}
