# Implement list pivoting

class Node:
  def __init__(self, data, node):
    self.data = data
    self.next = node

  def __str__(self):
    return str(self.data)

  def linkedlist(self):
    res = ''
    cur = self
    while cur.next:
      cur = cur.next
      res += str(cur) + ' '
    return res.strip()

def pivot(head, k):
  # keep track of 3 pointers to the last nodes of 3 different segments:
  # less than k, equal k, and greater than k
  if head == None:
    return
  less_than = head
  equal = head
  greater_than = head
  curr = head
  while curr.next:
    temp = curr.next
    if temp.data < k:
      perform(less_than, curr)
      if equal == less_than:
        equal = equal.next
      if greater_than == equal:
        greater_than = greater_than.next
      less_than = less_than.next
    elif temp.data == k:
      perform(equal, curr)
      if greater_than == equal:
        greater_than = greater_than.next
      equal = equal.next
    else:
      perform(greater_than, curr)
      greater_than = greater_than.next
    curr = curr.next

def perform(node, curr):
  temp = curr.next
  curr.next = curr.next.next
  temp.next = node.next
  node.next = temp

if __name__ == '__main__':
  head = Node(None, Node(6, Node(4, Node(10, Node(1, Node(7, None))))))
  print head.linkedlist()
  pivot(head, 6)
  print head.linkedlist()
