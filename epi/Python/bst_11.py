# Convert a sorted doubly linked list into a BST
# Let L be a doubly linked list of numbers, sorted in nondecreasing order. Design an algorithm
# that takes as input L, and builds a height-balanced BST on the entries in L. Your algorithm
# should run in O(n) time, where n is the number of nodes in L. You cannot use dynamic memory
# allocation - reuse the nodes of L for the BST. You can use O(logn) additional memeory implicitly
# on the function call stack. Use the next and prev fields for left and right, respectively
def linked_list_to_BST(head, n):
    if n <= 0:
        return
    curr = head.next
    container = []
    container.append(curr)
    return linked_list_to_BST_helper(container, 0, n-1)

def linked_list_to_BST_helper(container, s, e):
    if container[0] == None or s > e:
        return None
    mid = (s+e)/2
    left = linked_list_to_BST_helper(container, s, mid-1)
    # print container[0].data
    root = container[0]
    root.prev = left
    container[0] = container[0].next
    root.next = linked_list_to_BST_helper(container, mid+1, e)
    return root

def inorder(root):
    res = []
    inorder_helper(root, res)
    return res

def inorder_helper(root, res):
    if root:
        inorder_helper(root.prev, res)
        res.append(root.data)
        inorder_helper(root.next, res)

class Node():
    def __init__(self, data):
        self.data = data
        self.prev = None
        self.next = None

if __name__ == "__main__":
    head = Node(None)
    a = Node(1); b = Node(2); c = Node(3); d = Node(4); e = Node(5); f = Node(6)
    head.next = a; a.next = b; b.prev = a; b.next = c; c.prev = b; c.next = d;
    d.prev = c; d.next = e; e.prev = d; e.next = f; f.prev = e
    root = linked_list_to_BST(head, 6)
    # head = Node(None)
    # a = Node(1); b = Node(2); c = Node(3);
    # head.next = a; a.next = b; b.prev = a; b.next = c; c.prev = b
    # root = linked_list_to_BST(head, 3)
    # root = linked_list_to_BST_helper([a], 0, 2)
    print root.data
    print root.next.data
    print root.prev.data
    print inorder(root)
