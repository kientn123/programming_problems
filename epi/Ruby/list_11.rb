=begin
Implement cyclic right shift for singly linked list
Write a function that takes as input a singly linked list L and a nonnegative
integer k, and returns L cyclically shifted to the right by k. Do this with
O(1) additional memory and do not change the data stored within a node.
=end
require "libraries"

# Assume k needs to be less than number of nodes in the list
def right_shift(head, k)
  return head if head.nil? || head.next.nil? || head.next.next.nil?
  a = head
  b = head
  k.times do
    raise "k is too large" if b.next.nil?
    b = b.next
  end
  return head if b.next.nil?
  while b.next
    a = a.next
    b = b.next
    puts "a: " + a.to_s + " - b: " + b.to_s
  end
  temp = head.next
  head.next = a.next
  a.next = nil
  b.next = temp
  head
end

# rotate k%n when k >= n where n is the number of nodes in the list
def right_shift_2(head, k)
  return head if head.nil? || head.next.nil? || head.next.next.nil?
  tail = head
  count = 0
  while tail.next
    count += 1
    tail = tail.next
  end
  k %= count
  return head if k == 0
  steps = count - k
  a = head
  steps.times do
    a = a.next
  end
  temp = head.next
  head.next = a.next
  a.next = nil
  tail.next = temp
  head
end

head = Node.new(nil, Node.new(1, Node.new(2, Node.new(3, Node.new(4, Node.new(5, nil))))))
puts head.print_list
# puts right_shift(head, 1).print_list
# puts right_shift(head, 2).print_list
# puts right_shift(head, 3).print_list
puts right_shift_2(head, 2).print_list
