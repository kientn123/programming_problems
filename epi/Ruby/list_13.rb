=begin
Implement list zipping
Write a function that takes a singly linked list L, and reorders the elements
of L to form a new list representing zip(L). Your function should use O(1)
additional storage. The only field you can change in a node is next.
L = (l0, l1, ..., ln-1) => zip(L) = (l0, ln-1, l1, ln-2, ...)
=end
require "libraries"

def zip(head)
  return head if head.nil? || head.next.nil? || head.next.next.nil?
  n = len(head)
  half = (n/2.0).ceil
  runner = head
  half.times do
    runner = runner.next
  end
  second = Node.new(nil, nil)
  second.next = runner.next
  runner.next = nil
  reverse(second)
  head = merge(head, second)
  head
end

def reverse(head)
  return head if head.nil? || head.next.nil? || head.next.next.nil?
  a = head.next
  b = head.next.next
  while b
    temp = b.next
    b.next = a
    a.next = nil if a == head.next
    a = b
    b = temp
  end
  head.next = a
  head
end

def merge(h1, h2)
  return h1 if h2.nil? || h2.next.nil?
  return h2 if h1.nil? || h1.next.nil?
  run1 = h1.next
  run2 = h2.next
  while run1 && run2
    temp1 = run1.next
    temp2 = run2.next
    run1.next = run2
    run2.next = temp1
    run1 = temp1
    run2 = temp2
  end
  h1
end

def len(head)
  return 0 if head.nil?
  count = 0
  while head.next
    count += 1
    head = head.next
  end
  count
end

h1 = Node.new(nil, Node.new(1, Node.new(3, Node.new(5, nil))))
h2 = Node.new(nil, Node.new(2, Node.new(4, nil)))
puts merge(h1, h2).print_list
puts reverse(h1).print_list
head = Node.new(nil, Node.new(0, Node.new(1, Node.new(2, Node.new(3, Node.new(4,
Node.new(5, nil)))))))
head2 = Node.new(nil, Node.new(0, Node.new(1, Node.new(2, Node.new(3, Node.new(4,
Node.new(5, Node.new(6, nil))))))))
puts zip(head).print_list
puts zip(head2).print_list
