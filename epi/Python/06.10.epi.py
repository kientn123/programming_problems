# Given an array A of length n whose entries are floating point numbers, compute the largest product
# that can be made using n-1 entries in A. You cannot use an entry more than once. Your algorithm
# must run in O(n) time without using division. Can you design an algorithm that runs in O(1) space
# and O(n) time? Array entries may be positive, negative, or 0, and less than, equal to, or greater
# than 1 in absolute value
def largest_products(arr):
    if len(arr) == 0:
        return
    num_zeros = 0; num_positives = 0; num_negatives = 0
    max_negative = None; min_negative = None
    max_positive = None; min_positive = None
    for i in xrange(len(arr)):
        if arr[i] == 0:
            num_zeros += 1
        elif arr[i] > 0:
            num_positives += 1
            min_positive = arr[i] if min_positive == None else min(min_positive, arr[i])
        else: # arr[i] < 0
            num_negatives += 1
            max_negative = arr[i] if max_negative == None else max(max_negative, arr[i])
            min_negative = arr[i] if min_negative == None else min(min_negative, arr[i])
    target = 0
    if num_zeros >= 2:
        return 0
    elif num_zeros == 1:
        if (num_negatives&1) == 1:
            return 0
        target = 0
    else:
        if (num_negatives&1) == 1:
            target = max_negative
        else:
            if min_positive == None:
                target = min_negative
            else:
                target = min_positive
    res = 1
    found = False
    for x in arr:
        if x != min_negative or found:
            res *= x
        else:
            found = True
    return res

if __name__ == "__main__":
    arr = [3,2,-1,0.5]
    print largest_products(arr)
