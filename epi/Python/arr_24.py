# Compute rows in Pascal's Triangle
# Write a function which takes as input a nonnegative integer n and returns the first
# n rows of Pascal's triangle
def pascal(n):
    res = [None for _ in xrange(n)]
    for k in xrange(1, n+1):
        cur = [None for _ in xrange(k)]
        cur[0] = 1; cur[k-1] = 1
        for j in xrange(1, k-1):
            cur[j] = res[k-2][j-1] + res[k-2][j]
        res[k-1] = cur
    return res

if __name__ == "__main__":
    print pascal(5)
