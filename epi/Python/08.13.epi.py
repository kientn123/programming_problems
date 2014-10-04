# Implement list zipping
# <l0, l1, l2, ..., l(n-1)> => <l0, l(n-1), l1, l(n-2), ...>

class Node:
  def __init__(self, data, node):
    self.data = data
    self.next = node
  def __str__(self):
    return str(self.data)

  def linkedlist(self):
    runner = self;
    res = ''
    while runner.next != None:
      runner = runner.next
      res += str(runner) + ' '
    return res.strip()

def zip(head):
  count = 0
  runner = head
  while runner.next != None:
    runner = runner.next
    count += 1
  half = (count + 1)/2
  before_second_half = head
  for dummy_i in range(half):
    before_second_half = before_second_half.next
  reverse(before_second_half)
  runner1 = head.next
  runner2 = before_second_half.next
  before_second_half.next = None
  while runner1 and runner2:
    temp1 = runner1.next
    temp2 = runner2.next
    runner1.next = runner2
    runner2.next = temp1
    runner1 = temp1
    runner2 = temp2

def reverse(head):
  if head == None or head.next == None or head.next.next == None:
    return
  else:
    prev = head.next
    curr = prev.next
    prev.next = None
    while curr:
      temp = curr.next
      curr.next = prev
      prev = curr
      curr = temp
    head.next = prev

node2 = Node(2, Node(3, Node(4, Node(5, Node(6, None)))))
head = Node(None, Node(0, Node(1, node2)))
#reverse(node2)
zip(head)
print head.linkedlist()
