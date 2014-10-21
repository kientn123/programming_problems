# Compute the k smallest elements in a min-heap
# Modified from the original problem since python doesn't have standard
# implementation for max-heap
# Given a max-heap on n elements, represented as an array A, design an algorithm that
# computes the k smallest elements stored in A. You cannot modify the heap
from Queue import PriorityQueue
def find_k_smallest_elements(min_heap, k):
    if len(min_heap) == 0:
        return
    our_min_heap = PriorityQueue()
    res = []
    our_min_heap.put((min_heap[0], 0))
    for dummy in xrange(k):
        top = our_min_heap.get()
        res.append(top[0])
        if top[1]*2+1 < len(min_heap):
            our_min_heap.put((min_heap[top[1]*2+1], top[1]*2+1))
        if top[1]*2+2 < len(min_heap):
            our_min_heap.put((min_heap[top[1]*2+2], top[1]*2+2))
    return res

if __name__ == "__main__":
    min_heap = [1,2,9,3,6,10,13,4,5,6,7,8,11,12,14,15]
    print find_k_smallest_elements(min_heap, 5)
    print min_heap
