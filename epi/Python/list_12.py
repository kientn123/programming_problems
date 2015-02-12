# Implement even-odd merge

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


def even_odd_merge(head):
  if (head == None or head.next == None or head.next.next == None):
    return
  else:
    even = head.next
    odd = head.next.next
    runner_even = even
    runner_odd = odd
    while True:
      runner_even.next = runner_odd.next
      runner_even = runner_even.next
      if runner_even.next == None:
        runner_odd.next = None
        break
      runner_odd.next = runner_even.next
      runner_odd = runner_odd.next
      if runner_odd.next == None:
        break
    runner_even.next = odd

x = Node(None, Node(0, Node(1, Node(2, Node(3, Node(4, Node(5, None)))))))
y = Node(None, Node(0, Node(1, Node(2, Node(3, Node(4, None))))))
even_odd_merge(x)
even_odd_merge(y)
print x.linkedlist()
print y.linkedlist()
