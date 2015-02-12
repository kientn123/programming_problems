# Compute the exterior of a binary tree
# Write a function that prints the nodes on the exterior of a binary tree in
# anti-clockwise order. Print the nodes on the path from the root to the
# leftmost leaf in that order, then leaves from left to right, then nodes from
# the rightmost left up to the root.
def exterior_print(root):
    res = []
    if root == None:
        return res
    add_left_boundary(root, res)
    add_leaves(root, res)
    add_right_boundary(root, res)
    res.pop() # added the root twice
            # from add_left_boundary and add_right_boundary
    return res

def add_left_boundary(root, res):
    # Add boundary not including the
    if root == None:
        return
    curr = root
    while curr.left or curr.right:
        res.append(curr.data)
        curr = curr.left

def add_leaves(root, res):
    if root == None:
        return
    if root.left == None and root.right == None:
        res.append(root.data)
    else:
        add_leaves(root.left, res)
        add_leaves(root.right, res)

def add_right_boundary(root, res):
    if root == None:
        return
    add_right_boundary(root.right, res)
    if root.left or root.right:
        res.append(root.data)

class Node():
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

if __name__ == "__main__":
    a = Node(314); b = Node(6); c = Node(271)
    d = Node(28); e = Node(0); f = Node(561)
    g = Node(3); h = Node(17); i = Node(6)
    j = Node(2); k = Node(1); l = Node(401)
    m = Node(641); n = Node(257); o = Node(271); p = Node(28)

    a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
    f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
    l.right = m; i.right = o; o.right = p;
    print exterior_print(a);
