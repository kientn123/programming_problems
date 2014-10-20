# increment a big integer
def increment(lst):
    carry_on = 1
    i = len(lst) - 1
    while i>=0:
        lst[i], carry_on = (lst[i]+carry_on)%10, (lst[i]+carry_on)/10
        if carry_on == 0:
            break
        i -= 1

if __name__ == '__main__':
    lst = [1, 9, 9, 9, 9]
    lst2 = [2, 3, 5, 1, 5, 8]
    increment(lst)
    increment(lst2)
    print lst
    print lst2
