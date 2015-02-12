# Design an algorithm that takes a node n in a binary tree, and returns its
# successor. Assume each node has parent field; the parent field of root is
# null. A successor of a node n is node s that appears immediately after n in
# an inorder traversal
def successor(node):
    if node.right:
        target = node.right
        while target.left:
            target = target.left
        return target
    parent = node.parent
    curr = node
    while parent:
        if parent.left == curr:
            return parent
        parent = parent.parent
        curr = curr.parent
    return parent

class Node():
    def __init__(self, data, name):
        self.data = data
        self.name = name
        self.left = None
        self.right = None
        self.parent = None

if __name__ == "__main__":
    a = Node(314,"a"); b = Node(6,"b"); c = Node(271,"c")
    d = Node(28,"d"); e = Node(0,"e"); f = Node(561,"f")
    g = Node(3,"g"); h = Node(17,"h"); i = Node(6,"i")
    j = Node(2,"j"); k = Node(1,"k"); l = Node(401,"l")
    m = Node(641,"m"); n = Node(257,"n"); o = Node(271,"o"); p = Node(28,"p")

    a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
    f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
    l.right = m; i.right = o; o.right = p;

    b.parent = a; i.parent = a; c.parent = b; f.parent = b; j.parent = i
    o.parent = i; d.parent = c; e.parent = c; g.parent = f; h.parent = g
    k.parent = j; l.parent = k; n.parent = k; m.parent = l; p.parent = o

    print successor(g).name
    print successor(a).name
