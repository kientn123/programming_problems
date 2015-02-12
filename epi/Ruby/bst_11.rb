=begin
Convert a sorted doubly linked list into a BST
=end
require "libraries"
def convert(head)
  return head if head.nil? || head.next.nil?
  n = length(head)
  cur = [head.next]
  helper(cur, 0, n-1)
end

def helper(cur, left, right)
  return nil if left > right
  mid = (left + right) / 2
  left_tree = helper(cur, left, mid-1)
  parent = cur[0]
  cur[0] = cur[0].next
  parent.prev = left_tree
  parent.next = helper(cur, mid+1, right)
  parent
end

def length(head)
  return 0 if head.nil?
  count = 0
  head = head.next
  while head
    count += 1
    head = head.next
  end
  count
end

head = DNode.new(nil)
head.next = DNode.new(1)
head.next.next = DNode.new(2)
head.next.next.next = DNode.new(3)
head.next.next.next.next = DNode.new(4)
head.next.next.next.next.next = DNode.new(5)
head.next.prev = head
head.next.next.prev = head.next
head.next.next.next.prev = head.next.next
head.next.next.next.next.prev = head.next.next.next
head.next.next.next.next.next.prev = head.next.next.next.next

root = convert(head)
puts root.in_order_as_tree.to_s
puts root.pre_order_as_tree.to_s
