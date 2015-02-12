# Implement Stack and Queue using a heap
from Queue import PriorityQueue

class Stack():
    def __init__(self):
        self.heap = PriorityQueue()
        self.order = 0

    def push(self, n):
        self.heap.put((self.order, n))
        self.order -= 1

    def pop(self):
        return self.heap.get()[1]

class Queue():
    def __init__(self):
        self.heap = PriorityQueue()
        self.order = 0

    def enqueue(self, n):
        self.heap.put((self.order, n))
        self.order += 1

    def dequeue(self):
        return self.heap.get()[1]

if __name__ == "__main__":
    stack = Stack()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    print stack.pop()
    print stack.pop()
    print stack.pop()
    queue = Queue()
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    print queue.dequeue()
    print queue.dequeue()
    print queue.dequeue()
