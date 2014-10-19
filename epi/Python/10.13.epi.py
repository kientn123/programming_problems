# Reconstruct a binary tree from a preorder traversal with marker
# Suppose the preorder traversal routine is modified to mark where a left or
# right child was empty
def build_tree(preorder):
    # clever solution
    stack = []
    for i in xrange(len(preorder)-1,-1,-1):
        if preorder[i] == None:
            stack.append(preorder[i])
        else:
            left = stack.pop()
            right = stack.pop()
            preorder[i].left = left
            preorder[i].right = right
            stack.append(preorder[i])

def make_preorder(root):
    res = []
    def doit(node):
        res.append(node.name if node else None)
        if node:
            doit(node.left)
            doit(node.right)
    doit(root)
    return res


class Node():
    def __init__(self, data, name):
        self.data = data
        self.name = name
        self.left = None
        self.right = None

if __name__ == "__main__":
    a = Node(314,"a"); b = Node(6,"b"); c = Node(271,"c")
    d = Node(28,"d"); e = Node(0,"e"); f = Node(561,"f")
    g = Node(3,"g"); h = Node(17,"h"); i = Node(6,"i")
    j = Node(2,"j"); k = Node(1,"k"); l = Node(401,"l")
    m = Node(641,"m"); n = Node(257,"n"); o = Node(271,"o"); p = Node(28,"p")

    # a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
    # f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
    # l.right = m; i.right = o; o.right = p;
    preorder = [a, b, c, d, None, None, e, None, None, f, None,
                g, h, None, None, None, i, j, None, k, l, None,
                m, None, None, n, None, None, o, None, p, None, None]
    build_tree(preorder)
    print make_preorder(a)
