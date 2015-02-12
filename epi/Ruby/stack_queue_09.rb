=begin
Sort a stack
Design an algorithm to sort a stack S of n numbers in descending order, i.e,
the top of the stach holds the largest value. The only operations allowed
are push, pop, top, and empty. You cannot explicitly allocate memmory
outside of a few words.
=end

def sort(stack)
  unless stack.empty?
    temp = stack.pop
    sort(stack)
    insert(stack, temp)
  end
end

def insert(stack, e)
  if stack.empty? || stack[-1] <= e
    stack << e
  else
    temp = stack.pop
    insert(stack, e)
    stack << temp
  end
end

stack = [1,5,2,4,7,3,6]
sort(stack)
puts stack.to_s
