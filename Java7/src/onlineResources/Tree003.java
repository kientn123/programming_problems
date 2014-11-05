package onlineResources;
import java.util.*;

/**
 * Given a binary tree and two level number low and high, print nodes from level low to level high
 * @author kiennguyen
 *
 */
public class Tree003 {

	public static void main(String[] args) {
		TreeSet<Integer> set = new TreeSet<>();
		set.add(1); set.add(2); set.add(1);
		System.out.println(set.size());
	}

}
