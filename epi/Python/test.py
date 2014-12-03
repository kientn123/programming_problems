# from java.util import Comparator
# from java.util import PriorityQueue
# class Greater(Comparator):
#     def compare(self, a, b):
#         if a < b:
#             return -1
#         elif a > b:
#             return 1
#         else:
#             return 0
#
# q = PriorityQueue(1, Greater())
# q.add(10)
# q.add(15)
# q.add(5)
# print q.peek()
from random import randint
languages = ["Clojure", "Haskell", "Erlang"]
res = 0
for _ in xrange(10000):
    res += randint(0,2)
print languages[res / 10000]
