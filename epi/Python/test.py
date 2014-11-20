from java.util import Comparator
from java.util import PriorityQueue
class Greater(Comparator):
    def compare(self, a, b):
        if a < b:
            return -1
        elif a > b:
            return 1
        else:
            return 0

q = PriorityQueue(1, Greater())
q.add(1)
print q
