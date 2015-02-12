# Sum the leaves in binary tree encoding integers
# Compute the sum of the binary numbers represented by the root-to-leaf paths
def sum(root):
  return preorder_traversal(root, 0)

def preorder_traversal(node, n):
  if node == None:
    return 0
  else:
    n = 2*n + node.data
    if node.left == None and node.right == None:
      return n
    return preorder_traversal(node.left, n) + preorder_traversal(node.right, n)

class Node:
  def __init__(self, data, left, right):
    self.data = data
    self.left = left
    self.right = right

if __name__ == '__main__':
  root = Node(1, Node(0, Node(0, None, None), Node(1, None, None)), Node(1,\
          Node(0, None, None), Node(0, None, None)))
  print sum(root)
