# Compute the longest contiguous increasing sublist
def longest_contiguous(lst):
  if len(lst) == 0:
    return 0
  if len(lst) == 1:
    return (0, 0)
  longest = 0
  start = 0
  end = 0
  for i in range(1, len(lst)):
    if lst[i] <= lst[i-1]:
      if longest < i - start:
        longest = i - start
        end = i-1
        start = i
  return (end - longest + 1, end)

if __name__ == '__main__':
  lst = [2, 11, 3, 5, 13, 7, 19, 17, 23]
  print longest_contiguous(lst)
