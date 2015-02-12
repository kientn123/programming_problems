=begin
Remove duplicates from a sorted list
Write a function that takes as input a singly linked list L of n integers in
sorted order, and removes the duplicates from it. The list should remain sorted.
Perform the update in a single pass, and do not allocate additional node. Use
O(1) additional space and run in O(n) time.
=end
require "libraries"

def remove_duplicates(head)
  return head if head.nil? || head.next.nil?
  cur = head.next
  runner = head.next.next
  while runner
    if cur.data == runner.data
      cur.next = runner.next
    else
      cur = runner
    end
    runner = cur.next
  end
  head
end

head = Node.new(nil, Node.new(2, Node.new(2, Node.new(3, Node.new(5, Node.new(
5, Node.new(7, Node.new(11, nil))))))))
puts head.print_list
puts remove_duplicates(head).print_list
