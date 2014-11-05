package onlineResources;
import java.util.*;

/**
 * Difference between sums of odd level and even level nodes of a binary tree
 * Given a binary tree, find the difference between the sum of nodes at odd level and the sum of nodes
 * at even level. Consider root as level 1, left and right children of root as level 2 and so on
 * http://www.geeksforgeeks.org/difference-between-sums-of-odd-and-even-levels/
 * @author kiennguyen
 *
 */
public class Tree002 {

	public static void main(String[] args) {
		Node a=new Node(5), b=new Node(2), c=new Node(6), d=new Node(1),
				e=new Node(4), f=new Node(8), g=new Node(3), h=new Node(7), i=new Node(9);
		a.left = b; a.right = c; b.left = d; b.right = e; c.right = f; e.left = g;
		f.left = h; f.right = i;
		System.out.println(difference(a));
	}
	
	public static int difference(Node root) {
		if (root == null) return 0;
		return root.data - difference(root.left) - difference(root.right);
	}
	
	private static class Node {
		public int data;
		public Node left;
		public Node right;
		
		public Node(int data) {
			this.data = data;
			this.left = null;
			this.right = null;
		}
	}
}
