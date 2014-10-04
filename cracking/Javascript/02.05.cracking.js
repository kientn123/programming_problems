var Node = function(data, next) {
	this.data = data;
	this.next = next;
};

Node.prototype.toString = function() {
	return this.data.toString();
};

var determineCircular = function(head) {
	if (head.next === null) {
		return "empty linked list";
	} else if (head.next.next === null) {
		return "no circular linked list"
	} else {
		var runner1 = head,
		    runner2 = head;
		do {
			runner1 = runner1.next;
			runner2 = runner2.next.next;
		} while (runner1 != runner2);
		runner1 = head;
		while (runner1 != runner2) {
			runner1 = runner1.next;
			runner2 = runner2.next;
		}
		return runner1.toString();
	}
};
var node11 = new Node(11, null);
var node4 = new Node(4, new Node(5, new Node(6, new Node(7, new Node(8, new Node(9,
		new Node(10, node11)))))));
node11.next = node4;
var head = new Node(null, new Node(1, new Node(2, new Node(3, node4))));
var node5 = new Node(5, null);
var node3 = new Node(3, node5);
node5.next = node3;
var h2 = new Node(null, new Node(1, new Node(2, node3)));
console.log(determineCircular(h2));
//console.log(node4.next.next.next.next.next.next.next.next.toString());