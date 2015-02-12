=begin
Test whether a singly linked list is palindromic
Write a function that determines whether a sequence represented by a singly
linked list L is a palindrome. Assume L can be changed and does not have to
be restored to its original state.
=end
require "libraries"

def is_palindromic(head)
  return true if head.nil? || head.next.nil? || head.next.next.nil?
  slow = head
  fast = head
  while fast.next && fast.next.next
    slow = slow.next
    fast = fast.next.next
  end
  slow = slow.next if fast.next
  second = Node.new(nil, nil)
  second.next = slow.next
  slow.next = nil
  reverse(second)
  run1 = head.next
  run2 = second.next
  while run2
    return false if run1.data != run2.data
    run1 = run1.next
    run2 = run2.next
  end
  true
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

head = Node.new(nil, Node.new(1, Node.new(2, Node.new(3, Node.new(2, Node.new(3, nil))))))
puts is_palindromic(head)
