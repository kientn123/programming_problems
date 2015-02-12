package epi;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;
/*
 * Design an algorithm that reads packets and continuously maintains a uniform random subset
 * of size k of the packets after n > k-th packets are read
 */
public class Problem06_19 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println(randomSubset(scanner, 5));
	}
	
	public static ArrayList<Integer> randomSubset(Scanner scanner, int size) {
		ArrayList<Integer> res = new ArrayList<Integer>();
		for (int i=0; i<size; i++) {
			res.add(scanner.nextInt());
		}
		int n = size;
		Random rand = new Random();
		while (scanner.hasNextInt()) {
			int x = scanner.nextInt();
			if (x == 0) {
				break;
			}
			int index = rand.nextInt(n+1);
			if (index < size) {
				res.set(index, n);
			}
			n++;
		}
		return res;
	}
}
