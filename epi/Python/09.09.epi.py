# Sort a stack without explicitly allocate memory more than O(1)

def sort(stack):
  # Trick: if we can not explicitly store a bunch of stuff,
  # then do it recursively. The memory stack will do it for us
  if len(stack) == 0:
    return
  top = stack.pop()
  sort(stack)
  insert(stack, top)

def insert(stack, top):
  if len(stack) == 0 or stack[-1] <= top:
    stack.append(top)
  else:
    peek = stack.pop()
    insert(stack, top)
    stack.append(peek)

if __name__ == '__main__':
  stack = [5,4,6,8,7,2,1]
  sort(stack)
  print stack
