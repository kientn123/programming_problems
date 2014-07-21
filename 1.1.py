# Implement an algorithm to determine if a string has all unique characters.
# What if you can not use additional data structures?

def is_unique(s):
  char_set = [False] * 256
  for char in s:
    if char_set[ord(char)]: return False
    char_set[ord(char)] = True
  return True

print is_unique('computer')
print is_unique('science')
