package generals;

public class TreeNode {
	int data;
	TreeNode left, right;
	
	public TreeNode(int data) {
		this.data = data;
	}
	
	public TreeNode getLeft() {
		return left;
	}
	
	public TreeNode getRight() {
		return right;
	}
	
	public void setLeft(TreeNode other) {
		this.left = other;
	}
	
	public void setRight(TreeNode other) {
		this.right = other;
	}
}
