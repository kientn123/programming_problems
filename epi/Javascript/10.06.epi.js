/*
Design an algorithm to compute the sum of the binary numbers represented by
the root-to-leaf paths
*/
function solve(root) {
  if (root == null || root == undefined) {
    return 0;
  }
  var sum = [];

  function calculate(node, sumAbove) {
    var sumAtNode = sumAbove * 2 + node.data;
    if (node.left == null && node.right == null) {
      sum.push(sumAtNode);
    } else {
      if (node.left) {
        calculate(node.left, sumAtNode);
      }
      if (node.right) { calculate(node.right, sumAtNode); }
    }
  }

  calculate(root, 0);
  return sum;
}

function Node(data) {
  this.data = data;
  this.left = null;
  this.right = null;
}

var a = new Node(1), b = new Node(0), c = new Node(0),
    d = new Node(0), e = new Node(1), f = new Node(1),
    g = new Node(1), h = new Node(0), i = new Node(1),
    j = new Node(0), k = new Node(0), l = new Node(1),
    m = new Node(1), n = new Node(0), o = new Node(0), p = new Node(0);

a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
l.right = m; i.right = o; o.right = p;

console.log(solve(a));
