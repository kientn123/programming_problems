=begin
Remove the k-th last element from a list
Given a singly linked list L and an number k, write a function to remove the
k-th last element from L. Your algorithm cannot use more than a few words of
storage, regardless of the length of the list. In particular, you cannot
assume that it is possible to record the length of the list.
=end
require "libraries"

def delete_k_last(head, k)
  a = head
  b = head
  k.times do
    if b
      b = b.next
    else
      return "k is too large"
    end
  end
  b = b.next
  while b
    a = a.next
    b = b.next
  end
  a.next = a.next.next
  head
end

head = Node.new(nil, Node.new(1, Node.new(2, Node.new(3, Node.new(4, Node.new(
5, nil))))))
puts head.print_list
puts delete_k_last(head, 2).print_list
