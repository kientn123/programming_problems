# Compute the max difference
def max_difference(lst):
  # lst[j] - lst[i] where j >= i
  max_diff = 0
  _min = lst[0]
  for e in lst:
    max_diff = max(max_diff, e - _min)
    _min = min(_min, e)
  return max_diff

def max_difference_v2(lst):
  # lst[i] - lst[j], i, j have no restrictions
  _max = 0
  _min = 0
  for e in lst:
    _max = max(_max, e)
    _min = min(_min, e)
  return 'min: ' + str(_min), 'max: ' + str(_max), 'diff: ' + str(_max - _min)

if __name__ == '__main__':
  lst = [5, 7, 2, 8, 10, -1, 3]
  print max_difference(lst)
  print max_difference_v2(lst)
