# Permute the elements of a list
def permute(lst, p):
    # modify p and then restore it back
    runner = 0
    curr = 0
    for i in xrange(len(p)):
        if p[i] >= 0:
            curr = i
            runner = i
        while curr != p[runner]:
            swap(lst, curr, p[runner])
            temp = runner
            runner = p[runner]
            p[temp] = p[temp] - len(p)
        p[runner] = p[runner] - len(p)
    for i in xrange(len(p)):
        p[i] = p[i] + len(p)
    print p

def permute_v2(lst, p):
    # idea: each permutation is composed of many other permutations where each
    # is an indivisual movement
    # Can't restore p
    curr = 0
    while curr < len(p):
        if curr != p[curr]:
            swap(lst, curr, p[curr])
            swap(p, curr, p[curr])
        else:
            curr += 1
        print p

def swap(lst, i, j):
    if i != j:
        lst[i], lst[j] = lst[j], lst[i]

if __name__ == '__main__':
    lst = ['a', 'b', 'c', 'd']
    lst2 = ['a', 'b', 'c', 'd']
    p = [2, 0, 1, 3]
    p2 = [2, 0, 1, 3]
    permute(lst, p)
    permute_v2(lst2, p2)
    print lst
    print lst2
