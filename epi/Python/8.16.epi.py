# compute the median of a sorted circular linked list

class Node:
  def __init__(self, data, node):
    self.data = data
    self.next = node

  def __str__(self):
    return str(self.data)

  def linkedlist(self):
    runner = self
    res = ''
    # The trick the replace do-for loop in python. I like it :D
    while True:
      runner = runner.next
      res += str(runner) + ' '
      if runner.next == self.next:
        break
    return res.strip()

def median(head):
  if head == None or head.next == None or head.next.next == None:
    return
  else:
    biggest = head.next # biggest will point to the smallest
    count = 0
    runner = head
    while True:
      runner = runner.next
      count += 1
      if biggest.data <= runner.data:
        biggest = runner
      if runner.next == head.next:
        break
  print 'biggest: ' + str(biggest)
  mid = biggest
  for dummy_i in range((count+1)/2):
    mid = mid.next
  print mid
  return mid.data if count&1 else (mid.data + mid.next.data)/2.0

if __name__ == '__main__':
  node6 = Node(6, None)
  head = Node(None, Node(17, Node(1, Node(2, Node(3, Node(4, Node(5, node6)))))))
  node6.next = head.next
  print head.linkedlist()
  print median(head)
  print '0 is true' if 0 else '0 is false'
