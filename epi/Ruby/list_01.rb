=begin
L and F are ascending order singly linked list. Merge them together
using only O(1) space. The only field you can change in a node is next
=end
require "libraries"

# make 2 pointers traversing the two lists. Compare them every time one of the
# two pointers advances one step
# Like merge method in mergesort with 2 sorted arrays
def merge(h1, h2)
  return h1 if h2.nil?
  return h2 if h1.nil?
  m = Node.new(nil, nil)
  cur = m
  first = h1.next
  second = h2.next
  while first && second
    if first.data < second.data
      cur.next = first
      first = first.next
    else
      cur.next = second
      second = second.next
    end
    cur = cur.next
  end
  while first
    cur.next = first
    first = first.next
    cur = cur.next
  end
  while second
    cur.next = second
    second = second.next
    cur = cur.next
  end
  m
end

h1 = Node.new(nil, Node.new(1, Node.new(2, Node.new(5, Node.new(7, nil)))))
h2 = Node.new(nil, Node.new(3, Node.new(11, nil)))
puts merge(h1, h2).print_list
