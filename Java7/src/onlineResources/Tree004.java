package onlineResources;
import java.util.*;

/**
 * Find k-th smallest element in BST, given the root and k
 * @author kiennguyen
 *
 */
public class Tree004 {

	public static void main(String[] args) {
		Node a = new Node(20), b=new Node(8), c=new Node(22),
				d = new Node(4), e=new Node(12), f=new Node(10), g=new Node(14);
		a.left = b; a.right = c; b.left = d; b.right = e; e.left = f; e.right = g;
		System.out.println(findNode(a, 3));
		System.out.println(findNode(a, 5));
	}
	
	public static Node findNode(Node root, int k) {
		if (root==null) return null;
		int count=k;
		Stack<Pair<Node, Boolean>> stack = new Stack<>();
		stack.push(new Pair<>(root, false));
		while (!stack.empty()) {
			Pair<Node, Boolean> top = stack.pop();
			if (top.second) {
				if (--count==0) return top.first;
			} else {
				if (top.first.right!=null) stack.add(new Pair<>(top.first.right, false));
				stack.add(new Pair<>(top.first, true));
				if (top.first.left!=null) stack.add(new Pair<>(top.first.left, false));
			}
		}
		
		return null;
	}
	
	private static class Node {
		public int data;
		public Node left;
		public Node right;
		
		public Node(int data) {
			this.data = data;
			left = null;
			right = null;
		}
		
		public String toString() {
			return Integer.toString(this.data);
		}
	}
	
	private static class Pair<T, S> {
		public T first;
		public S second;
		
		public Pair(T first, S second) {
			this.first = first;
			this.second = second;
		}
	}
}
