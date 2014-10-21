# Sort an almost-sorted list
# Input consists of a very long sequence of numbers. Each number is at most k
# position away from its correctly sorted position. Design an algorithm that
# outputs the numbers in the correct order and uses O(k) storage, independent
# of the number of elements processed
#
# Idea: since each number is at most k position of its correct one => the
# smallest element in the first k+1 elements is the smallest one of the whole
# list. The (k+2)_th element or later cannot be placed in the first position
# since they are more than k positions away
from Queue import PriorityQueue
def sort_almost_sorted_list(a_list, k):
    if len(a_list) == 0:
        return
    min_heap = PriorityQueue()
    res = []
    for i in xrange(k+1):
        min_heap.put(a_list[i])
    pointer = k+1
    while not min_heap.empty():
        top = min_heap.get()
        res.append(top)
        if pointer < len(a_list):
            min_heap.put(a_list[pointer])
            pointer += 1
    return res

if __name__ == "__main__":
    a_list = [2,1,4,0,5,3,9,8,6,7]
    print sort_almost_sorted_list(a_list, 3)
