# Implement a queue with max operation so that the series of m combined
# enqueue, dequeue, and max operations can be done in O(n) time
from Queue import Queue
from collections import deque
class MaxQueue:
  def __init__(self):
    self.data = Queue()
    self.max_data = deque()

  def enqueue(self, n):
    self.data.put(n)
    while len(self.max_data) and self.max_data[-1] < n:
      self.max_data.pop()
    self.max_data.append(n)

  def dequeue(self):
    if self.data.empty():
      return 'nothing else to dequeue'
    pop = self.data.get()
    if pop == self.max_data[0]:
      self.max_data.popleft()
    return pop

  def max(self):
    return self.max_data[0]

if __name__ == '__main__':
  mq = MaxQueue()
  mq.enqueue(5)
  mq.enqueue(7)
  mq.enqueue(4)
  mq.enqueue(2)
  print mq.max()
  mq.dequeue()
  mq.dequeue()
  print mq.max()
  mq.dequeue()
  print mq.max()
