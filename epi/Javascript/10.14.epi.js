/*
Form a linked list from the leaves of a binary tree.
The leaves should appear from left to right
*/
function solve(root) {
  var head = new LinkedListNode(null, null);
  if (root == null || root == undefined) {
    return head;
  }
  var currLinkedList = head;

  function establish(treeNode) {
    if (treeNode.left == null && treeNode.right == null) {
      var newLinkedListNode = new LinkedListNode(treeNode.data, null);
      currLinkedList.next = newLinkedListNode;
      currLinkedList = currLinkedList.next;
      console.log(currLinkedList.data);
    } else {
      if (treeNode.left) {
        establish(treeNode.left);
      }
      if (treeNode.right) {
        establish(treeNode.right);
      }
    }
  }

  establish(root);
  return head;
}

function Node(data) {
  this.data = data;
  this.left = null;
  this.right = null;
}

function LinkedListNode(data, node) {
  this.data = data;
  this.next = node;
}

LinkedListNode.prototype.inspect = function() {
  var res = "head->";
  var curr = this;
  while (curr.next) {
    curr = curr.next;
    res += curr.data.toString() + "->";
  }
  return res;
}

var a = new Node(314), b = new Node(6), c = new Node(271),
    d = new Node(28), e = new Node(0), f = new Node(561),
    g = new Node(3), h = new Node(17), i = new Node(6),
    j = new Node(2), k = new Node(1), l = new Node(401),
    m = new Node(641), n = new Node(257), o = new Node(271), p = new Node(28);

a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
l.right = m; i.right = o; o.right = p;

//var head = new LinkedListNode(null, new LinkedListNode(2, new LinkedListNode(3, null)));
console.log(solve(a).inspect());
