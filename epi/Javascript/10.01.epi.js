/*
Decide if a tree is balanced. Use O(h) additional storage, where h is height
of the tree.
A tree is balanced if at every single node except for the leaves, the height of the
left subtree and the height of the right subtree do not difference more than 1
*/

function Node(data) {
	this.data = data;
	this.left = null;
	this.right = null;
}

function height(root) {
	if (root == null || root == undefined) {
		return -1;
	}
	var l = height(root.left);
	if (l == -2) {
		return -2;
	}
	var r = height(root.right);
	if (r == -2) {
		return -2;
	}
	if (Math.abs(r - l) > 1) {
		return -2;
	} else {
		return 1 + Math.max(r, l);
	}
}

function isBalanced(root) {
	return height(root) == -2 ? false : true;
}

// My way, more intuitive
function isBalancedV2(root) {
	if (root == null || root == undefined) {
		// Consider nothing has height of -1
		return {
			isBalanced: true, height: -1
		};
	}
	var left = isBalancedV2(root.left);
	var right = isBalancedV2(root.right);
	if (left.isBalanced && right.isBalanced) {
		var diff = Math.abs(left.height - right.height);
		if (diff > 1) {
			return {
				isBalanced: false, height: 0
			};
		} else {
			return {
				isBalanced: true, height: Math.max(left.height, right.height) + 1
			};
		}
	} else {
		return {
			isBalanced: false, height: 0
		};
	}
}

function solve(root) {
	return isBalancedV2(root).isBalanced;
}
var a = new Node(314), b = new Node(6), c = new Node(271),
		d = new Node(28), e = new Node(0), f = new Node(561),
		g = new Node(3), h = new Node(17), i = new Node(6),
		j = new Node(2), k = new Node(1), l = new Node(401),
		m = new Node(641), n = new Node(257), o = new Node(271), p = new Node(28),
		test = new Node('test')
		a1 = new Node(1), a2 = new Node(2), a3 = new Node(3);
a1.left = a2; a1.right = a3;

a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
l.right = m; i.right = o; o.right = p;

//f.left = new Node(1); p.left = new Node(2); j.left = test; test.left = new Node(1);
//o.left = new Node(1);

console.log(isBalanced(a));
console.log(solve(a));
