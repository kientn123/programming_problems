# Compute a random subset
# Design an algorithm that computes an array of size k consisting of distinct
# integers in the set [0..n-1]. All subsets should be equally likely and in
# addition, all permutations of elements of the array should be equally likely.
# Your time complexity should be O(k). Your algorithm can use O(k) space in
# addition to the k element array for the result.
from random import randint
def random_subset(n, k):
    res = []
    hashmap = {}
    for i in xrange(k):
        index = randint(0, n-1-i)
        if index not in hashmap and (n-1-i) not in hashmap:
            res.append(index)
            hashmap[index] = n-1-i
        elif index in hashmap and (n-1-i) not in hashmap:
            res.append(hashmap[index])
            hashmap[index] = n-1-i
        elif index not in hashmap and (n-1-i) in hashmap:
            res.append(index)
            hashmap[index] = hashmap[n-1-i]
        else: # index in hashmap and (n-1-i) in hashmap
            res.append(hashmap[index])
            hashmap[index] = hashmap[n-1-i]
    return res

if __name__ == "__main__":
    print random_subset(10, 5)
