# Delete duplicates from a sorted array
def delete_duplicates(lst):
    if len(lst) == 0:
        return
    runner = 1
    for i in range(1, len(lst)):
        if lst[i] - lst[i-1]:
            lst[runner] = lst[i]
            runner += 1
    count = runner
    while runner < len(lst):
        lst[runner] = 0
        runner += 1
    return count

if __name__ == '__main__':
  lst = [2, 3, 5, 5, 7, 11, 11, 11, 13]
  print delete_duplicates(lst)
  print lst
