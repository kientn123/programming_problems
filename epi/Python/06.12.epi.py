# Enumerate all primes to n
def primes_generator(n):
  if n < 2:
    return []
  primes = [2]
  for i in range(3, n+1):
    prime = True
    for j in xrange(len(primes)):
      if i % primes[j] == 0:
        prime = False
    if prime:
      primes.append(i)
  return primes

# more efficient ones, of course more space
def primes_generator_v2(n):
  is_primes = [True] * (n+1)
  primes = []
  for i in xrange(2, n+1):
    if is_primes[i]:
      primes.append(i)
      runner = i
      while runner <= n:
        is_primes[runner] = False
        runner += i
  return primes

if __name__ == '__main__':
  print primes_generator(20)
  print primes_generator_v2(20)
