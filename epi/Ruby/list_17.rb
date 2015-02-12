=begin
Implement a function which takes as input a singly linked list L and an integer
k and performs a pivot of L with respect to k. The relative ordering of nodes
that appear before k, and after k, must remain unchanged; the same must hold
for nodes holding keys equal to k. You cannot change the keyw within nodes.
Your code must run in O(1) space
=end
require "libraries"

def pivot(head, k)
  return head if head.nil? || head.next.nil?
  runner = head.next
  head_less = Node.new(nil, nil)
  head_equal = Node.new(nil, nil)
  head_greater = Node.new(nil, nil)
  tail_less = head_less
  tail_equal = head_equal
  tail_greater = head_greater
  while runner
    if runner.data < k
      tail_less.next = runner
      tail_less = tail_less.next
    elsif runner.data == k
      tail_equal.next = runner
      tail_equal = tail_equal.next
    else
      tail_greater.next = runner
      tail_greater = tail_greater.next
    end
    runner = runner.next
  end
  tail_greater.next = nil
  tail_equal.next = head_greater.next
  tail_less.next = head_equal.next
  head.next = head_less.next
  head
end

head = Node.new(nil, Node.new(1, Node.new(5, Node.new(3, Node.new(2, Node.new(
3, Node.new(2, Node.new(4, nil))))))))
head1 = Node.new(nil, Node.new(1, Node.new(5, nil)))
puts head.print_list
puts pivot(head, 3).print_list
puts pivot(head1, 3).print_list
