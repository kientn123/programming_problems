# Compute the k closest stars
# How would you compute the k stars which are closest to the Earth? You have
# only a few megabytes of RAM
import math
from Queue import PriorityQueue
def compute_k_closest_stars(stars, k):
    if len(stars) == 0:
        return
    max_heap = PriorityQueue()
    for i in xrange(k):
        max_heap.put(stars[i])
    for i in xrange(k+1, len(stars)):
        top = max_heap.get()
        max_heap.put(max(top, stars[i]))
    res = []
    while not max_heap.empty():
        res.append(max_heap.get().name)
    res.reverse()
    return res

class Star():
    def __init__(self, name, x, y, z):
        self.x = x
        self.y = y
        self.z = z
        self.name = name

    def __cmp__(self, other_star):
        this = math.sqrt(self.x ** 2 + self.y ** 2 + self.z ** 2)
        other = math.sqrt(other_star.x ** 2 + other_star.y ** 2 + other_star.z ** 2)
        if this > other:
            return -1
        elif this < other:
            return 1
        else:
            return 0

if __name__ == "__main__":
    a = Star("a",1,1,1)
    b = Star("b",2,2,2)
    c = Star("c",3,3,3)
    d = Star("d",4,4,4)
    e = Star("e",5,5,5)
    print compute_k_closest_stars([a,b,c,d,e],2)
