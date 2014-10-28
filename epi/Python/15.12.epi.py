# Convert a BST to a sorted doubly linked list
# Design an algorithm that takes as input a BST B an returns a sorted doubly linked list on the
# same elements. Your algorithm should not allocate any new nodes. The original BST does not have
# to be preserved; use its nodes as the nodes of the resulting list
def bst_to_linked_list(root):
    l = Node(None)
    first = bst_to_linked_list_helper(root)[0]
    l.right = first
    return l
def bst_to_linked_list_helper(root):
    if root.left == None and root.right == None:
        return (root, root)
    left = root
    right = root
    if root.left:
        res1 = bst_to_linked_list_helper(root.left)
        root.left = res1[1]
        res1[1].right = root
        left = res1[0]
    if root.right:
        res2 = bst_to_linked_list_helper(root.right)
        root.right = res2[0]
        res2[0].left = root
        right = res2[1]
    return (left, right)

class Node():
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

    def __str__(self):
        curr = self
        res = str(self.data)
        while curr.right:
            curr = curr.right
            res += " -> " + str(curr.data)
        return res

if __name__ == "__main__":
    a = Node(7); b = Node(3); c = Node(11); d = Node(2); e = Node(5)
    a.left = b; a.right = c; b.left = d; b.right = e
    l = bst_to_linked_list(a)
    print l.right
