# Design an algorithm tat takes a set of files containing stock trades sorted
# by increasing trade times, and writes a single file containing the trades
# appearing in the individual files sorted in the same order. The algorithm
# should use very little RAM, ideally of the order of a few kilobytes.

# Modified: given k sorted arrays, sort them in a single array efficiently
from Queue import PriorityQueue
def sort(lists):
    if len(lists) == 0:
        return
    min_heap = PriorityQueue()
    for i in xrange(len(lists)):
        if len(lists[i]):
            min_heap.put((lists[i][0], i))

    res = []
    curr_at_list = [0] * len(lists)
    while not min_heap.empty():
        top = min_heap.get()
        res.append(top[0])
        top_is_from_list = top[1]
        if curr_at_list[top_is_from_list] + 1 < len(lists[top_is_from_list]):
            curr_at_list[top_is_from_list] += 1
            min_heap.put((lists[top_is_from_list][curr_at_list[top_is_from_list]],
                          top_is_from_list))
    return res

if __name__ == "__main__":
    a = [1,3,5,7,15]
    b = [2,6,12,16]
    c = [4,8,9,10,14]
    print sort([a,b,c])
