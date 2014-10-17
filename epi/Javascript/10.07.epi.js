/*
Find a root to leaf path with specified sum
Write a function which takes as input an integer s and a binary tree T with
integer node weights, returns true if there exists a leaf whose path weight
equals s
*/
function solve(root, k) {
  if (root == null || root == undefined) {
    return false;
  }

  function solveSum(node, sumAbove) {
    if (node.data + sumAbove == k) {
      return true;
    } else {
      var left = false, right = false;
      if (node.left) {
        left = solveSum(node.left, sumAbove + node.data);
      }
      if (node.right) {
        right = solveSum(node.right, sumAbove + node.data);
      }
      return left || right;
    }
  }

  return solveSum(root, 0);
}

function Node(data) {
  this.data = data;
  this.left = null;
  this.right = null;
}
var a = new Node(314), b = new Node(6), c = new Node(271),
    d = new Node(28), e = new Node(0), f = new Node(561),
    g = new Node(3), h = new Node(17), i = new Node(6),
    j = new Node(2), k = new Node(1), l = new Node(401),
    m = new Node(641), n = new Node(257), o = new Node(271), p = new Node(28);

a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
l.right = m; i.right = o; o.right = p;

console.log(solve(a, 590));
