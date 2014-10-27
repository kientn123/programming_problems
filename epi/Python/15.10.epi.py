# Build a BST from a sorted array
# How would you build a BST of minimum possible height from a soted array A
def build_tree(arr):
    if len(arr) == 0:
        return None
    mid = len(arr)/2
    root = Node(arr[mid])
    root.left = build_tree(arr[:mid])
    root.right = build_tree(arr[mid+1:])
    return root

def inorder(root):
    res = []
    inorder_helper(root, res)
    return res

def inorder_helper(root, res):
    if root:
        inorder_helper(root.left, res)
        res.append(root.data)
        inorder_helper(root.right, res)

class Node():
    def __init__(self, data):
        self.data = data

if __name__ == "__main__":
    arr = [1,2,3,4,5,6,7,8,9,10]
    root = build_tree(arr)
    print inorder(root)
