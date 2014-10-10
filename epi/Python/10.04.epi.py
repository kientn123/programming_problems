# Lowest common ancestor
# A very clever solution
class Node:
  def __init__(self, data):
    self.data = data
    self.left = None
    self.right = None

  def __str__(self):
    return str(self.data)

def common_ancestor(root, a, b):
  # Assume a and b in the tree
  # if root is a or b then return root
  # else: root.left contains a or b and root.right contains a or be,
  # return root
  if root == None:
    return None
  if root == a or root == b:
    return root
  else:
    l = common_ancestor(root.left, a, b)
    r = common_ancestor(root.right, a, b)
    if l and r:
      return root
    else:
      return l if l else r

if __name__ == '__main__':
  a = Node('a')
  b = Node('b')
  c = Node('c')
  d = Node('c')
  e = Node('e')
  f = Node('f')
  a.left = b; a.right = c; b.left = d; b.right = e; e.right = f
  print common_ancestor(a, d, f)
