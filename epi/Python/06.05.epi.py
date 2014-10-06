# Delete a key from an array
def delete(lst, k):
  runner = 0
  for i in range(len(lst)):
    if lst[i] - k:
      lst[runner] = lst[i]
      runner += 1
  count = runner
  while runner < len(lst):
    lst[runner] = 0
    runner += 1
  return count

if __name__ == '__main__':
  lst = [5, 3, 7, 11, 2, 3, 13, 5, 7]
  print delete(lst, 3)
  print lst
