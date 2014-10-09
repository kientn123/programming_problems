# Implement a queue API using 2 stacks
class StackBasedQueue:
  def __init__(self):
    self.stack1 = []
    self.stack2 = []

  def enqueue(self, n):
    self.stack1.append(n)

  def dequeue(self):
    if len(self.stack2) == 0:
      while len(self.stack1):
        self.stack2.append(self.stack1.pop())
    return self.stack2.pop()

  def __str__(self):
    res = ''
    for i in reversed(self.stack2):
      res += str(i) + ' '
    for i in self.stack1:
      res += str(i) + ' '
    return res.strip()

if __name__ == '__main__':
  q = StackBasedQueue()
  q.enqueue(4)
  q.enqueue(7)
  print q.dequeue()
  q.enqueue(9)
  q.enqueue(10)
  print q.dequeue()
  print q
