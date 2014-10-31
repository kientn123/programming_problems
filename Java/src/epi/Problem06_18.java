package epi;
import java.util.*;

public class Problem06_18 {

	public static void main(String[] args) {
		System.out.println(randomSubset(20, 10));
	}
	
	public static ArrayList<Integer> randomSubset(int n, int k) {
		HashMap<Integer, Integer> hm = new HashMap<Integer, Integer>();
		Random rand = new Random();
		for (int i=0; i<k; i++) {
			int num = rand.nextInt(n-i);
			if (hm.get(n-i-1) == null && hm.get(num) == null) {
				hm.put(n-1-i, num);
				hm.put(num, n-1-i);
			} else if (hm.get(n-i-1) != null && hm.get(num) == null) {
				hm.put(n-i-1, num);
				hm.put(num, hm.get(n-i-1));
			} else if (hm.get(num) != null && hm.get(n-i-1) == null) {
				hm.put(num, n-i-1);
				hm.put(n-i-1, hm.get(num));
			} else {
				int temp = hm.get(n-i-1);
				hm.put(n-i-1, hm.get(num));
				hm.put(num, temp);
			}
		}
		ArrayList<Integer> res = new ArrayList<Integer>();
		for (int i=0; i<k; i++) {
			res.add(hm.get(n-i-1));
		}
		return res;
	}
}
