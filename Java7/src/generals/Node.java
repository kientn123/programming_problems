package generals;

public class Node {
	int data;
	Node next;
	
	public Node(int data) {
		this.data = data;
	}
	
	public Node getNext() {
		return this.next;
	}
	
	public void setNext(Node next) {
		this.next = next;
	}
}
