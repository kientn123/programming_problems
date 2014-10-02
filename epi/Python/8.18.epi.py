# Sort a linked list
# Perform insertion sort on linked list

class Node:
  def __init__(self, data, node):
    self.data = data
    self.next = node

  def __str__(self):
    return str(self.data)

  def linkedlist(self):
    res = 'L -> '
    curr = head
    while curr.next:
      curr = curr.next
      res += str(curr) + ' -> '
    return res

def sort(head):
  if head==None or head.next==None:
    return
  curr = head
  while curr.next:
    target = curr.next
    runner = head
    swap = False
    while runner.next!=target:
      if runner.next.data > target.data:
        swap = True
        curr.next = curr.next.next
        target.next = runner.next
        runner.next = target
        print 'curr: ' + str(curr)
        print 'target: ' + str(target)
        print 'runner: ' + str(runner)
        print head.linkedlist()
        break
      runner = runner.next
    if not swap:
      curr = curr.next

if __name__ == '__main__':
  head = Node(None, Node(5, Node(4, Node(7, Node(10, Node(9, Node(8, Node(6, None))))))))
  print head.linkedlist()
  sort(head)
  print head.linkedlist()
