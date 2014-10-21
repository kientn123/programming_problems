# Design an efficient algorithm for sorting a k-increasing-decreasing list.
# You are given another array of the same size that the result should be
# written to, and you can use O(k) additional storage
from Queue import PriorityQueue
def sort_k_increasing_decreasing_list(a_list):
    lists = make_list_of_sorted_lists(a_list)
    return sort(lists)

def make_list_of_sorted_lists(a_list):
    is_increasing = True
    start_index = 0
    res = []
    for i in xrange(1, len(a_list)+1):
        if i == len(a_list) or (a_list[i-1]>a_list[i] and is_increasing) or \
            (a_list[i-1]<a_list[i] and not is_increasing):
            if is_increasing:
                res.append(a_list[start_index:i])
            else:
                if start_index == 0:
                    res.append(a_list[i-1::-1])
                else:
                    res.append(a_list[i-1:start_index-1:-1])
            start_index = i
            is_increasing = not is_increasing
    return res

def sort(lists):
    if len(lists) == 0:
        return
    min_heap = PriorityQueue()
    for i in xrange(len(lists)):
        if len(lists[i]):
            min_heap.put((lists[i][0], i))

    res = []
    curr_of_list = [0] * len(lists)
    while not min_heap.empty():
        top = min_heap.get()
        res.append(top[0])
        top_is_from_list = top[1]
        if curr_of_list[top_is_from_list]+1 < len(lists[top_is_from_list]):
            curr_of_list[top_is_from_list] += 1
            min_heap.put((lists[top_is_from_list][curr_of_list[top_is_from_list]],
                            top_is_from_list))
    return res

if __name__ == "__main__":
    a_list = [57,131,493,294,221,339,418,452,442,190]
    print make_list_of_sorted_lists(a_list)
    print sort_k_increasing_decreasing_list(a_list)
