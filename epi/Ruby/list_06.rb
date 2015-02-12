=begin
Let h1 and h2 be the heads of 2 lists respectively. How would you determine if
there exists a node r reachable from both h1 & h2 by following the next fields?
If such a node exists, find the node that appears earliest when traversing the
lists. You are constrained to use no more than constant additional storage.
=end
require "libraries"

def common_node(h1, h2)
  info1 = find_length(h1)
  info2 = find_length(h2)
  if info1[:last] == info2[:last]
    diff = (info1[:count]-info2[:count]).abs
    if info1[:count] > info2[:count]
      h1 = move(h1, diff)
    else
      h2 = move(h2, diff)
    end
    while h1 != h2
      h1 = h1.next
      h2 = h2.next
    end
    h1
  else
    nil
  end
end

def find_length(head)
  count = 0
  last = nil
  while head
    count += 1
    last = head
    head = head.next
  end
  {count: count, last: last}
end

def move(head, k)
  k.times do
    head = head.next if head
  end
  head
end

common = Node.new(5, Node.new(6, Node.new(7, nil)))
h1 = Node.new(1, Node.new(2, Node.new(3, common)))
h2 = Node.new(4, common)
puts common_node(h1, h2).to_s
