# Check if a board game is winnable
# Write a function which takes an array of n integers, where A[i] denotes
# the maximum you can advance from index i, and returns whether it is
# possible to advance to the last index starting from the beginning
# of the array
def is_winnable(lst):
  maximum = 0
  for i in range(len(lst)):
    if maximum < i:
      return False
    maximum = max(maximum, i + lst[i])
  return True

if __name__ == '__main__':
  lst = [3, 3, 1, 0, 2, 0, 1]
  lst2 = [3, 2, 0, 0, 2, 0, 1]
  print is_winnable(lst)
  print is_winnable(lst2)
