#When finding the n-th term of a sequence defined by a recurrence relation,
#we can simply use the recurrence relation to generate terms for progressively
#larger values of n. This problem introduces us to the computational technique
#of dynamic programming, which successively builds up solutions by using the
#answers to smaller cases.

#Given: Positive integers n<=40 and k<=5.

#Return: The total number of rabbit pairs that will be present after n months
#if we begin with 1 pair and in each generation, every pair of reproduction-age
#rabbits produces a litter of k rabbit pairs (instead of only 1 pair).

#Sample dataset: 5 3
#Sample output: 19

import sys
def fib(n, k):
  ''' Formula: S(n) = S(n-1) + S(n-2)*3 '''
  mapping = {1: 1, 2: 1}
  if n not in mapping:
    mapping[n] = fib(n-1, k) + k * fib(n-2, k)
  return mapping[n]

if __name__ == '__main__':
  if len(sys.argv) == 2:
    f = open(sys.argv[1], 'r')
    [n, k] = map(int, f.readline().strip().split(' '))
    print fib(n, k)
