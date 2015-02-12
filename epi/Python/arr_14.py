# Compute the next permutation according to the dictionary ordering
def next_permutation(lst):
  if len(lst) < 2:
    return 'no next permutation'
  i = len(lst) - 2
  while i >= 0:
    if lst[i] < lst[i+1]:
      break
    i -= 1
  print 'i: ' + str(i)
  if i == -1:
    return 'no next permutation'
  j = len(lst) - 1
  while j > i:
    if lst[j] > lst[i]:
      break
    j -= 1
  swap(lst, i, j)
  reverse(lst, i+1, len(lst) - 1)

def swap(lst, i, j):
  lst[i], lst[j] = lst[j], lst[i]

def reverse(lst, i, j):
  left = i
  right = j
  while left < right:
    swap(lst, left, right)
    left += 1
    right -= 1

if __name__ == '__main__':
  lst = [4, 3, 2, 1, 0]
  lst2 = [6, 2, 1, 5, 4, 3, 0]
  #swap(lst, 0, 2)
  #print lst
  next_permutation(lst)
  next_permutation(lst2)
  print lst
  print lst2
