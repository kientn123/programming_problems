class Node:
  def __init__(self, data, node):
    self.data = data
    self.next = node

  def __str__(self):
    return str(self.data)
