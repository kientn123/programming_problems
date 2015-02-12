# Print a 2D-list in spiral order
def spiral(lst):
  if len(lst) == 0:
    print 'nothing'
    return
  res = ''
  for i in xrange(len(lst)/2):
    for j in xrange(i, len(lst)-1-i):
      res += str(lst[i][j]) + ' '
    res += '-> '

    for j in xrange(i, len(lst)-1-i):
      res += str(lst[j][len(lst)-1-i]) + ' '
    res += '-> '

    for j in xrange(len(lst)-1-i, i, -1):
      res += str(lst[len(lst)-1-i][j]) + ' '
    res += '-> '

    for j in xrange(len(lst)-1-i, i, -1):
      res += str(lst[j][i]) + ' '
    res += '-> '
  if len(lst)&1:
    res += str(lst[len(lst)/2][len(lst)/2])
  return res

if __name__ == '__main__':
  lst = [[1, 2, 3, 7],
         [4, 5, 6, 10],
         [7, 8, 9, 11],
         [14, 12, 13, 15]]
  lst2 = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]
  print spiral(lst)
  print spiral(lst2)
