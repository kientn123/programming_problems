# Design an algorithm that creates uniformly random permutations of [0,1,..,n-1]. You are given
# a random number generator that returns integers in the set (0,1,..,n-1) with equal probability;
# use as few calls to it as possible
import random
def random_permutation(arr):
    # The same as 06.16.epi.py with k = len(arr)
    for i in xrange(len(arr)):
        index = random.randint(i,len(arr)-1)
        swap(arr, i, index)
    return arr

def swap(arr, i, j):
    if i != j:
        arr[i], arr[j] = arr[j], arr[i]

if __name__ == "__main__":
    arr = [1,2,3,4,5,6,7,8,9,10]
    print random_permutation(arr)
