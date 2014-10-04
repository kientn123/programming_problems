function Node(data, next) {
	this.data = data;
	this.next = next;
}

Node.prototype.toString = function() {
	return this.data;
};

Node.prototype.toList = function() {
	var toReturn = "";
	var curr = head;
	while (curr.next !== null) {
		curr = curr.next;
		toReturn += curr.toString() + ", ";
	}
	return toReturn + "null";
}

function removeDuplicates(head) {
	if (head.next === null) {
		return "empty linked list";
	} else if (head.next.next === null) {
		return "only 1 node exists in this linked list";
	} else {
		var prev = head;
		var curr = head.next;
		while (curr !== null) {
			var runner = head.next;
			while (runner != curr) {
				if (runner.data === curr.data) {
					prev.next = curr.next;
					curr = curr.next;
					break;
				}
				runner = runner.next;
			}
			if (runner == curr) {
				prev = curr;
				curr = curr.next;
			}
		}
	}
}

var head = new Node(null, new Node(1, new Node(2, new Node(2, 
	new Node(3, new Node(3, new Node(3, new Node(4, null))))))));
removeDuplicates(head);
console.log(head.toList());