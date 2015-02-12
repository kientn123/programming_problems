# Test if parens, brackets, and braces are matched

def is_match(s):
  stack = []
  for char in s:
    if char == '(' or char == '[' or char == '{':
      stack.append(char)
    elif char == '}':
      if len(stack)==0 or stack[-1]!='{':
        return False
      else:
        stack.pop()
    elif char == ']':
      if len(stack)==0 or stack[-1]!='[':
        return False
      else:
        stack.pop()
    elif char == ')':
      if len(stack)==0 or stack[-1]!='(':
        return False
      else:
        stack.pop()
    else:
      return 'wrong input format'
    print 'current stack: ' + str(stack)
  return True if len(stack)==0 else False
print is_match('()[]{()()}')
