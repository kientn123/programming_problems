# Design an algorithm and write code to remove the duplicate characters in a
# string without using any additional buffer. NOTE: One or two additional
# variables are fine. An extra copy of the array is not

def remove_duplicates(s):
  if s == None: return
  if len(s) < 2: return
  tail = 1;
  for i in range(1, len(s)):
    for j in range(tail):
      if s[i] == s[j]: break
    if j == tail:
      s[tail] == s[i]
      tail += 1
  s[tail] = 0

  
