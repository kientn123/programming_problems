# Given a list lst, find the length of a longest subarray of whose
# entries are equal
def longest_sublist(lst):
    if len(lst) == 0:
        return 0
    if len(lst) == 1:
        return 1
    longest = 0
    start = 0
    for i in range(1, len(lst)):
        longest = max(longest, i - start)
        if lst[i] != lst[i-1]:
            start = i
    return longest

if __name__ == '__main__':
    lst = [4, 4, 5, 5, 5, 6, 7, 7, 2]
    print longest_sublist(lst)
