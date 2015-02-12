# Find the k-largest element in a list

def k_largest_element(arr, k):
  left = 0
  right = len(arr) - 1
  while left <= right:
    mid = (left+right)/2
    print mid
    pos = partition(arr, left, right, mid)
    print pos
    if pos == k-1:
      return arr[pos]
    elif pos > k-1:
      right = pos - 1
    else:
      left = pos + 1
  return 'something went wrong'

def partition(arr, left, right, mid):
  swap(arr, left, mid)
  target = arr[left]
  runner = left + 1
  for i in range(left+1, right+1):
    if arr[i] > target:
      swap(arr, i, runner)
      runner += 1
  swap(arr, left, runner-1)
  print arr
  return runner-1

def swap(arr, i, j):
  arr[i], arr[j] = arr[j], arr[i]

if __name__ == '__main__':
  alist = [3,2,1,5,4]
  print k_largest_element(alist, 3)
