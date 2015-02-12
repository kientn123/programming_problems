# Compute the closest entries in three sorted arrays
# Design an algorithm that takes three sorted arrays A, B and C and returns a triple
# (i,j,k) such that distance(i,j,k) is minimum. Your algorithm should run in O(Na+Nb+Nc)
# time, where Nu is length of array U
# distance(i,j,k) = max(|Ai-Bj|, |Ai-Ck|, |Bj-Ck|)
def closest_entries(lists):
    res = tuple(lists[i][0] for i in xrange(len(lists)))
    # print res
    res_distance = max(res) - min(res)
    indexes = [0 for dummy in xrange(len(lists))]
    entries = set([ArrayData(i,lists[i][0]) for i in xrange(len(lists))])
    # print entries
    while True:
        # print res
        distance = max(entries).data - min(entries).data
        if distance < res_distance:
            res_distance = distance
            res = tuple(i for i in indexes)
        min_entry_is_from = min(entries).from_list
        if indexes[min_entry_is_from] + 1 >= len(lists[min_entry_is_from]):
            return res
        indexes[min_entry_is_from] += 1
        entries.remove(min(entries))
        entries.add(ArrayData(min_entry_is_from, lists[min_entry_is_from]\
            [indexes[min_entry_is_from]]))

class ArrayData():
    def __init__(self, from_list, data):
        self.from_list = from_list
        self.data = data

    def __comp__(self, other):
        if self.data != other.data:
            return self.data.__comp__(other.data)
        else:
            return other.from_list.__comp__(self.from_list)

if __name__ == "__main__":
    lists = [[1,4,7,10], [15,16], [12,14]]
    print closest_entries(lists) # (3,0,0)
