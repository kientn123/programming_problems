def num_of_stranges(l, r):
  count = 0 if 10 - l <= 0 else 10 - l
  for i in xrange(5, 10):
    count += compute(i*2, l, r, 2)
  return count

def compute(cur, l, r, num_digits):
  if cur > r:
    return 0
  count = 0
  if cur >= l:
    count += 1
  first = cur * (num_digits)
  if first < 10 ** num_digits and first >= 10 ** (num_digits-1):
    count += compute(first, l, r, num_digits)
  second = cur * (num_digits + 1)
  if second < 10 ** (num_digits+1) and second >= 10 ** num_digits:
    count += compute(second, l, r, num_digits+1)
  return count

if __name__ == '__main__':
  t = input()
  for dummy_i in xrange(t):
    l, r = map(int, raw_input().strip().split(' '))
    print num_of_stranges(l, r)
