=begin
Implement even-odd merge
Write a function that takes a singly linked list L, and reorders the elements
in L so that new list represents even-odd elements from the original one
alternatively. Your function should use O(1) additional space. The only field
you can change in the node is next.
=end
require "libraries"

def even_odd(head)
  return head if head.nil? || head.next.nil? || head.next.next.nil?
  odd = head.next.next
  even_runner = head.next
  odd_runner = odd
  until odd_runner.nil? || odd_runner.next.nil?
    even_runner.next = odd_runner.next
    odd_runner.next = odd_runner.next.next
    even_runner = even_runner.next
    odd_runner = odd_runner.next
  end
  even_runner.next = odd
  head
end

head = Node.new(nil, Node.new(0, Node.new(1, Node.new(2, Node.new(3, Node.new(4,
Node.new(5, nil)))))))
puts even_odd(head).print_list
