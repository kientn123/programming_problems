/*
Find k-unbalanced nodes
Define a node in a binary tree to be k-balanced if the difference in the number
of nodes in its left substree and right subtree is no more than k
Design an algorithm that takes as input a binary tree and positive number k,
and returns a node u in the binary tree such that u is not k-balanced, but all
of us's descendants are k-balanced. If no such node exists, return null.
*/
function findKUnbalanced(root, k) {
  if (root == null || root == undefined) {
    return {
      node: null,
      total: 0
    };
  }
  var left = findKUnbalanced(root.left, k);
  var right = findKUnbalanced(root.right, k);
  if (left.node == null && right.node == null) {
    var difference = Math.abs(left.total - right.total);
    if (difference > k) {
      return {
        node: root,
        total: 0
      };
    } else {
      return {
        node: null,
        total: left.total + right.total + 1
      };
    }
  } else {
    if (left.node) {
      return {
        node: root.left, total: 0
      };
    } else {
      return {
        node: root.right, total: 0
      };
    }
  }
}

function solve(root, k) {
  return findKUnbalanced(root, k).node;
}

function Node(data) {
  this.data = data;
  this.left = null;
  this.right = null;
}

Node.prototype.toString = function() {
  return this.data.toString();
}

var a = new Node(314), b = new Node(6), c = new Node(271),
    d = new Node(28), e = new Node(0), f = new Node(561),
    g = new Node(3), h = new Node(17), i = new Node(6),
    j = new Node(2), k = new Node(1), l = new Node(401),
    m = new Node(641), n = new Node(257), o = new Node(271), p = new Node(28);

a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
l.right = m; i.right = o; o.right = p;
console.log(solve(a, 3) == i);
