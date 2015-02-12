# Given an inorder and preorder traversals of a binary tree, write a function
# to reconstruct the tree
def construct_tree(pre_order, in_order):
    in_order_map = {}
    for i in xrange(len(in_order)):
        in_order_map[in_order[i]] = i
    construct_helper(pre_order, 0, len(pre_order)-1,
                     in_order, 0, len(in_order)-1,
                     in_order_map)

def construct_helper(pre_order, pre_start, pre_end,
                     in_order, in_start, in_end,
                     in_order_map):
    if pre_start <= pre_end and in_start <= in_end:
        root = pre_order[pre_start]
        print root.name
        index = in_order_map[root]
        left_subtree_length = index - in_start
        root.left = \
            construct_helper(pre_order, pre_start+1, pre_start+left_subtree_length,
                             in_order, in_start, index-1,
                             in_order_map)
        root.right = \
            construct_helper(pre_order, pre_start+left_subtree_length+1, pre_end,
                             in_order, index+1, in_end,
                             in_order_map)
        return root
    else:
        return None

class Node():
    def __init__(self, data, name):
        self.data = data
        self.name = name
        self.left = None
        self.right = None

def pre_order_function(root):
    res = []
    pre_order_helper(root, res)
    return res

def pre_order_helper(root, res):
    if root:
        res.append(root.name)
        pre_order_helper(root.left, res)
        pre_order_helper(root.right, res)

def in_order_function(root):
    res = []
    in_order_helper(root, res)
    return res

def in_order_helper(node, res):
    if node:
        if node.left:
            in_order_helper(node.left, res)
        res.append(node.name)
        if node.right:
            in_order_helper(node.right, res)

if __name__ == "__main__":
    a = Node(314,"a"); b = Node(6,"b"); c = Node(271,"c")
    d = Node(28,"d"); e = Node(0,"e"); f = Node(561,"f")
    g = Node(3,"g"); h = Node(17,"h"); i = Node(6,"i")
    j = Node(2,"j"); k = Node(1,"k"); l = Node(401,"l")
    m = Node(641,"m"); n = Node(257,"n"); o = Node(271,"o"); p = Node(28,"p")

    pre_order = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p]
    in_order = [d, c, e, b, f, h, g, a, j, l, m, k, n, i, o, p]
    construct_tree(pre_order, in_order)
    print pre_order_function(a)
    print in_order_function(a)
