# Find the first missing positive entry
# First approach: using dictionary
def missing_positive(lst):
  dct = {}
  for e in lst:
    if e not in dct:
      dct[e] = True
  for i in range(1, len(lst) + 2):
    if i not in dct:
      return i

# Second approach: modify list such that lst[i] contains i+1
def missing_positive_v2(lst):
  i = 0
  while i<len(lst):
    if lst[i] != i+1 and lst[lst[i]-1] != lst[i] \
      and lst[i] != 0 and lst[i] < len(lst)+1:
      swap(lst, i, lst[i]-1)
    else:
      i += 1
  for j in range(1, len(lst) + 2):
    if lst[j-1] != j:
      return j

def swap(lst, i, j):
  lst[i], lst[j] = lst[j], lst[i]

if __name__ == '__main__':
  lst = [2, 4, 1, 0, 5]
  print missing_positive(lst)
  print missing_positive_v2(lst)
