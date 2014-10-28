# Test if three BST nodes are totally ordered
# Let r, s and m be distinct nodes in a BST. In this BST, nodes do not have parent pointers to
# their parents and all keys are unique. Write a function which returns true if m has both an
# ancestor and a descendant in the set {r, s}.
def are_totally_order(r, s, m):
    return (ancestor_of(r, m) and ancestor_of(m, s)) or \
        (ancestor_of(s, m) and ancestor_of(m, r))

def ancestor_of(r, m):
    curr = r
    while curr:
        if curr.data > m.data:
            curr = curr.left
        elif curr.data < m.data:
            curr = curr.right
        else:
            return True
    return False

class Node():
    def __init__(self, data, name):
        self.data = data
        self.name = name
        self.left = None
        self.right = None

if __name__ == "__main__":
    a = Node(19,"a"); b = Node(7,"b"); c = Node(3,"c")
    d = Node(2,"d"); e = Node(5,"e"); f = Node(11,"f")
    g = Node(17,"g"); h = Node(13,"h"); i = Node(43,"i")
    j = Node(23,"j"); k = Node(37,"k"); l = Node(29,"l")
    m = Node(31,"m"); n = Node(41,"n"); o = Node(47,"o");
    q = Node(53,"q")

    a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e
    f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n
    l.right = m; i.right = o; o.right = q

    print are_totally_order(a, k, j)
    print are_totally_order(i, q, j)
