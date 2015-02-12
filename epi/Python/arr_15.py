# Rotate an array
# Design an O(n) algorithm for rotating an array A of n elements to the right by i positions. You
# are allowed O(1) additional storage.
def rotate_array(arr, i):
    num = gcd(len(arr), i)
    for j in xrange(num):
        rotate_helper(arr, j, i)

def rotate_helper(arr, pos, step):
    cur = pos
    while (cur+step) % len(arr) != pos:
        next_step = (cur+step) % len(arr)
        swap(arr, pos, next_step)
        cur = next_step

def swap(arr, i, j):
    if i != j:
        arr[i], arr[j] = arr[j], arr[i]

def gcd(a, b):
    big = max(a, b); small = min(a, b)
    while small > 0:
        temp = small
        small = big % small
        big = temp
    return big

if __name__ == "__main__":
    arr = [1,2,3,4,5,6,7,8,9,10]
    rotate_array(arr, 2)
    print arr
    arr1 = [1,2,3,4,5,6,7,8,9,10]
    rotate_array(arr1, 3)
    print arr1
