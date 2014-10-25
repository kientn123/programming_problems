# Given array arr and index i, do the pivot with arr[i]
def pivot(arr, i):
    if len(arr) <= 1:
        return
    target = arr[i]
    left = 0
    for j in range(0, len(arr)):
        if arr[j] < target:
            swap(arr, left, j)
            left += 1
    runner = left # runner plays a role like left does above
    for j in range(left, len(arr)):
        if arr[j] == target:
            swap(arr, runner, j)
            runner += 1

def swap(arr, i, j):
    arr[i], arr[j] = arr[j], arr[i]


if __name__ == '__main__':
    arr = [1, 3, 8, 2, 6, 7, 4, 5, 4, 3, 2, 2, 5, 6]
    print arr
    pivot(arr, 6)
    print arr
