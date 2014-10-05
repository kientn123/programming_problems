# print the keys in a BST not using recursion

class Node:
  def __init__(self, data, left, right):
    self.data = data
    self.left = left
    self.right = right

def keys_print(root):
  # Observe the left and right of the current
  stack = []
  stack.append((root, False))
  sequence = []
  while len(stack):
    tup = stack.pop()
    if tup[1]:
      sequence.append(tup[0].data)
    else:
      if tup[0].right:
        stack.append((tup[0].right, False))
      if tup[0].left == None:
        sequence.append(tup[0].data)
      else:
        stack.append((tup[0], True))
        stack.append((tup[0].left, False))
  return sequence

def keys_print_2(root):
  # Observe the current node
  if root == None:
    return
  stack = []
  sequence = []
  curr = root
  while len(stack) or curr:
    if curr:
      stack.append(curr)
      curr = curr.left
    else:
      curr = stack.pop()
      sequence.append(curr.data)
      curr = curr.right
  return sequence


if __name__ == '__main__':
  root = Node(43, Node(23, None, Node(37, Node(29, None, Node(31, None, None)) \
                        , Node(41, None, None))), \
                  Node(47, None, Node(53, None, None)))
  print str(keys_print(root))
  print str(keys_print_2(root))
