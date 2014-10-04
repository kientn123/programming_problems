# Test for palindromic permutations

def can_permute(s):
  dct = {}
  for char in s:
    if char not in dct:
      dct[char] = 0
    dct[char] += 1
  count = 0
  print dct
  for k, v in dct.iteritems():
    if v&1:
      count+=1
      if count>1:
        return False
  return True

if __name__ == '__main__':
  print can_permute('edified')
