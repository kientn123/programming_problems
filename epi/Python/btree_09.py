# Let T be the root of a binary tree in which nodes have an explicit parent
# field. Design an algorithm that enumerates the nodes inorder and uses O(1)
# additional space. Your algorithm cannot modify the tree
def in_order_traversal(root):
  prev = None
  curr = root
  next_curr = None
  res = []
  while curr:
    if not prev or prev.left == curr or prev.right == curr:
      if curr.left:
        next_curr = curr.left
      else:
        res.append(curr.data)
        next_curr = curr.right if curr.right else curr.parent
    elif curr.left == prev:
      res.append(curr.data)
      next_curr = curr.right if curr.right else curr.parent
    else: # curr.right = prev
      next_curr = curr.parent
    prev = curr
    curr = next_curr
  return res

class Node():
  def __init__(self, data):
    self.data = data
    self.left = None
    self.right = None
    self.parent = None

if __name__ == "__main__":
  a = Node(314); b = Node(6); c = Node(271)
  d = Node(28); e = Node(0); f = Node(561)
  g = Node(3); h = Node(17); i = Node(6)
  j = Node(2); k = Node(1); l = Node(401)
  m = Node(641); n = Node(257); o = Node(271); p = Node(28)

  a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
  f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
  l.right = m; i.right = o; o.right = p;

  b.parent = a; i.parent = a; c.parent = b; f.parent = b; j.parent = i
  o.parent = i; d.parent = c; e.parent = c; g.parent = f; h.parent = g
  k.parent = j; l.parent = k; n.parent = k; m.parent = l; p.parent = o

  print in_order_traversal(a)
