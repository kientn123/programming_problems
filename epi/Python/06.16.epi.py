# Let A be an array whose entries are all distinct. Implement an algorithm that takes A and an
# integer k and returns a subset of k elements of A. All subsets should be equally likely. Use
# as few calls to the random number generator as possible and use O(1) additional storage. You
# can return the result in the same array as input
import random
def random_subset(arr, k):
    if len(arr) == 0:
        return
    for i in xrange(k):
        index = random.randint(i, len(arr)-1)
        swap(arr, i, index)
    return arr

def swap(arr, i, j):
    if i != j:
        arr[i], arr[j] = arr[j], arr[i]

if __name__ == "__main__":
    arr = [1,2,3,4,5,6,7,8,9,10]
    print random_subset(arr, 5)
