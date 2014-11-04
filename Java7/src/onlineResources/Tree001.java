package onlineResources;
import java.util.*;

/**
 * Print all nodes at distance k from a given node
 * http://www.geeksforgeeks.org/print-nodes-distance-k-given-node-binary-tree/
 * @author kiennguyen
 *
 */
public class Tree001 {

	public static void main(String[] args) {
		TreeNode a = new TreeNode(20), b=new TreeNode(8), c=new TreeNode(22),
				d = new TreeNode(4), e=new TreeNode(12), f=new TreeNode(10), g=new TreeNode(14);
		a.left = b; a.right = c; b.left = d; b.right = e; e.left = f; e.right = g;
		ArrayList<TreeNode> res = distanceK(a, b, 2);
		for (TreeNode node : res) {
			System.out.println(node);
		}
	}
	
	public static ArrayList<TreeNode> distanceK(TreeNode root, TreeNode target, int distance) {
		ArrayList<TreeNode> res = new ArrayList<>();
		distanceKHelper(root, target, distance, res);
		return res;
	}
	
	public static int distanceKHelper(TreeNode root, TreeNode target,
			int distance, ArrayList<TreeNode> res) {
		if (root==null) return -1;
		if (root==target) {
			findDescendantsOfDistanceK(root, distance, res);
			return 0;
		}
		
		int left = distanceKHelper(root.left, target, distance, res);
		if (left!=-1) {
			if (left+1==distance) res.add(root);
			else {
				int newDistance = distance-left-2;
				if (newDistance >= 0) {
					findDescendantsOfDistanceK(root.right, newDistance, res);
				}
			}
			
			return left+1;
		}
		
		int right = distanceKHelper(root.right, target, distance, res);
		if (right!=-1) {
			if (right+1==distance) res.add(root);
			else {
				int newDistance = distance-right-2;
				if (newDistance >= 0) {
					findDescendantsOfDistanceK(root.left, newDistance-1, res);
				}
			}
			
			return right+1;
		}
		
		return -1;
	}
	
	private static void findDescendantsOfDistanceK(TreeNode root, int distance,
			ArrayList<TreeNode> res) {
		if (root==null || distance<0) return;
		if (distance==0) res.add(root);
		else {
			findDescendantsOfDistanceK(root.left, distance-1, res);
			findDescendantsOfDistanceK(root.right, distance-1, res);
		}
	}
	
	private static class TreeNode {
		public int data;
		public TreeNode left;
		public TreeNode right;
		
		public TreeNode(int data) {
			this.data = data;
			left = null;
			right = null;
		}
		
		public String toString() {
			return Integer.toString(this.data);
		}
	}

}
