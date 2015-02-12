=begin
reverse a singly linked list O(n) time and O(1) space
=end
require "libraries"

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

case3 = Node.new(nil, Node.new(2, Node.new(3, Node.new(4, Node.new(5, nil)))))
case1 = Node.new(nil, Node.new(1, nil))
case2 = Node.new(nil, Node.new(1, Node.new(2, nil)))

puts reverse(case1).print_list
puts reverse(case2).print_list
puts reverse(case3).print_list
