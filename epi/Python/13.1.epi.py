# partition into anagrams

def partition(a_set):
  dct = {}
  for item in a_set:
    s = ''.join(sorted(item))
    if s not in dct:
      dct[s] = []
    dct[s].append(item)
  for x in dct:
    if len(dct[x]) >= 2:
      res = ''
      for s in dct[x]:
        res += s + ', '
      print res[:-2]

if __name__ == '__main__':
  a_set = set(['haha', 'ahah', 'hoho', 'ohoh', 'hihi'])
  partition(a_set)
