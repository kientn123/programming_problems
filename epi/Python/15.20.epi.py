# Test if a binary tree is a min-first BST
# A min-first bst is one in which the minimum key is stored at the root; each key in the left subtree
# is less than every key in the right substree. The subtrees themselves are min-first BSTs
# Write a function that takes a min-first BST T and a key k, and returns true iff T contains k
def contains(root, k):
    if root == None or k < root.data:
        return False
    if root.data == k:
        return True
    if root.right and root.right.data <= k:
        return contains(root.right, k)
    else:
        return contains(root.left, k)

class Node():
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

if __name__ == "__main__":
    a = Node(2); b = Node(3); c = Node(13); d = Node(5); e = Node(17); f = Node(19)
    g = Node(7); h = Node(11); i = Node(23)
    a.left = b; a.right = c; b.right = d; c.left = e; c.right = f
    d.left = g; d.right = h; f.left = i
    print contains(a, 5)
    print contains(a, 20)
