# Computer the longest substring with matching parens

def longest(s):
  # start off with a dummy char node
  # for each node, keep track of the length of the closest parens matching
  # after that node's character
  stack = [{'char': 'dummy', 'count': 0}]
  for char in s:
    if char == '(':
      stack.append({'char': '(', 'count': 0})
    else:
      if stack[-1]['char'] == '(':
        top = stack.pop()
        stack[-1]['count'] += 2 + top['count']
      else:
        stack.append({'char': ')', 'count': 0})
    print 'current stack: ' + str(stack)
  largest = 0
  while len(stack):
    top = stack.pop()
    if largest < top['count']:
      largest = top['count']
  return largest

def longest_2(s):
  start_off = -1
  res = 0
  stack = []
  for i in range(len(s)):
    if s[i] == '(':
      stack.append(s[i])
      start_off += 1
    else:
      if len(stack) == 0 or stack[-1] == ')':
        start_off = i + 1
      else:
        res = max(res, i - start_off + 1)
        start_off -= 1
        stack.pop()
  return res

if __name__ == '__main__':
  print longest('((())()(()(')
  print longest_2('((())()(()(')
