# Write a function which takes as input a binary tree T and preforms a
# preorder traversal of T. You cannot make use of recursion. Nodes do not
# contain parent references. You are restricted to O(h) space, where h is the
# height of T. Do the same for a post order.
def pre_order(root):
    if root == None:
        return
    stack = [root]
    res = []
    while len(stack):
        target = stack.pop()
        res.append(target.name)
        if target.right:
            stack.append(target.right)
        if target.left:
            stack.append(target.left)
    return res
    
class Node():
    def __init__(self, data, name):
        self.data = data
        self.name = name
        self.left = None
        self.right = None

def post_order(root):
    if root == None:
        return
    stack = [(root, False)]
    res = []
    while len(stack):
        target = stack.pop()
        if (target[0].left == None and target[0].right == None) or target[1]:
            res.append(target[0].name)
        else:
            stack.append((target[0], True))
            if target[0].right:
                stack.append((target[0].right, False))
            if target[0].left:
                stack.append((target[0].left, False))
    return res

if __name__ == "__main__":
    a = Node(314,"a"); b = Node(6,"b"); c = Node(271,"c")
    d = Node(28,"d"); e = Node(0,"e"); f = Node(561,"f")
    g = Node(3,"g"); h = Node(17,"h"); i = Node(6,"i")
    j = Node(2,"j"); k = Node(1,"k"); l = Node(401,"l")
    m = Node(641,"m"); n = Node(257,"n"); o = Node(271,"o"); p = Node(28,"p")

    a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
    f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
    l.right = m; i.right = o; o.right = p;

    print pre_order(a)
    print post_order(a)
