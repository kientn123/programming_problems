# Find the longest subarray with distinct entries

def longest_subarr(arr):
  start_off = 0
  res_start = -1
  res_end = -1
  res = 0
  most_recent_appearance = {}
  for i in range(len(arr)):
    if arr[i] in most_recent_appearance:
      start_off = most_recent_appearance[arr[i]] + 1
    if res < i - start_off + 1:
      res_start = start_off
      res_end = i
      res = res_end - res_start + 1
    most_recent_appearance[arr[i]] = i
  return arr[res_start:(res_end + 1)], res

if __name__ == '__main__':
  print longest_subarr([5, 7, 5, 11, 13, 2, 11, 19, 2, 11])
