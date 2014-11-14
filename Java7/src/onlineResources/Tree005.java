package onlineResources;
import java.util.*;

/**
 * Given a perfect binary tree, print nodes in level order but nodes should be from left and right side
 * alternatively.
 * @author kiennguyen
 *
 */
public class Tree005 {

	public static void main(String[] args) {
		Node root = new Node(1);
		root.left = new Node(2);
		root.right = new Node(3);
		root.left.left = new Node(4);
		root.left.right = new Node(5);
		root.right.left = new Node(6);
		root.right.right = new Node(7);
		
		root.left.left.left  = new Node(8);
	    root.left.left.right  = new Node(9);
	    root.left.right.left  = new Node(10);
	    root.left.right.right  = new Node(11);
	    root.right.left.left  = new Node(12);
	    root.right.left.right  = new Node(13);
	    root.right.right.left  = new Node(14);
	    root.right.right.right  = new Node(15);
	    
	    ArrayList<Integer> res = specialLevelOrder(root);
	    System.out.println(res);
	}
	
	public static ArrayList<Integer> specialLevelOrder(Node root) {
		// Suppose the tree satisfies the requirement of a perfect binary tree
		if (root == null) return null;
		ArrayList<Integer> res = new ArrayList<>();
		res.add(root.data);
		Queue<Node> left = new LinkedList<>();
		Queue<Node> right = new LinkedList<>();
		if (root.left == null) return res;
		left.add(root.left); right.add(root.right);
		while (!left.isEmpty()) {
			Node first = left.remove();
			Node second = right.remove();
			res.add(first.data); res.add(second.data);
			if (first.left != null) {
				left.add(first.left); left.add(first.right);
				right.add(second.right); right.add(second.left);
			}
		}
		return res;
	}
	
	private static class Node {
		public int data;
		public Node left;
		public Node right;
		
		public Node(int data) {
			this.data = data;
		}
	}
}
