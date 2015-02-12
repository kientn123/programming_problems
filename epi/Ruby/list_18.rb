=begin
Sort a list
Write a function that takes as input a singly linked list whose nodes hold
integer keys and sorts the list. The sort must be stable - if nodes u and v
appear in that order, and their keys are equal, then u must continue to
appear before v after sorting. You must use O(1) space, and cannot change node
contents.
=end
require "libraries"

def insertion_sort(head)
  return head if head.nil? || head.next.nil? || head.next.next.nil?
  cur = head.next
  while cur.next
    runner = head
    until runner.next == cur.next
      break if runner.next.data > cur.next.data
      runner = runner.next
    end
    unless runner == cur
      temp = runner.next
      runner.next = cur.next
      cur.next = cur.next.next
      runner.next.next = temp
    end
    # Be really carefull here
    cur = cur.next unless runner.next && runner.next.next == cur
  end
  head
end

head = Node.new(nil, Node.new(3, Node.new(2, Node.new(2, Node.new(11,
Node.new(7, Node.new(5, Node.new(11, nil))))))))
puts head.print_list
puts insertion_sort(head).print_list
