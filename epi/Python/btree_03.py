# Determine if a tree is symmetric
def is_symmetric(root):
  if root == None:
    return True
  return compare(root.left, root.right)

def compare(a, b):
  if a == None and b == None:
    return True
  if a == None or b == None:
    return False
  if a.data == b.data:
    return compare(a.left, b.left) and compare(a.right, b.right)

class Node:
  def __init__(self, data):
    self.data = data
    self.left = None
    self.right = None

  def __str__(self):
    return str(self.data)
