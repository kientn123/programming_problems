'''
You are given 32-bit numbers, N and M, and two bit positions, i and j. Write a method to set all bits between i and j in N equal to M (e.g., M becomes a substring of N located at i and starting at j).
Example:
input: N = 10000000000, M = 10101, i = 2, j = 6
output: N = 10001010100
'''
def update(n, m, i, j):
  i_pos = n >> i
  i_pos <<= i
  j_pos = n >> (j + 1)
  j_pos <<= (j + 1)
  between = i_pos - j_pos
  return (n - between) + (m << i)

n = 69
m = 5
print update(n, m, 1, 3)
