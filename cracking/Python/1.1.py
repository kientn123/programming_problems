# Implement an algorithm to determine if a string has all unique characters.
# What if you can not use additional data structures?

def is_unique(s):
  char_set = [False] * 256
  for char in s:
    if char_set[ord(char)]: return False
    char_set[ord(char)] = True
  return True

def is_unique_2(s):
  runner = 0
  for char in s:
    val = 1 << (ord(char) - ord('a'))
    if runner & val >= 1: return False
    runner |= val
  return True

print is_unique('computer')
print is_unique('science')
print is_unique_2('computer')
print is_unique_2('science')
