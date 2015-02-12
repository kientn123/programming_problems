=begin
Copy a posting list
Implement a function which takes as input a pointer to the head of a postings
list L, and returns a copy of the postings list. Your function should take
O(n) time, where n is the length of the postings list and should use O(1)
storage beyond what required for the n nodes in the copy. You can modify the
original list, but must store it to its original state before returning.

In a posting list, each node has a data field, a field for the next pointer,
and a jump field - the jump field points to any other node.
=end

class Node
  attr_accessor :data, :next, :jump
  def initialize(data, node, jump)
    @data = data
    @next = node
    @jump = jump
  end

  def to_s
    @data.to_s
  end

  def print_list
    node = self.next
    while node
      puts "data: " + node.to_s + ", jump: " + node.jump.to_s
      node = node.next
    end
  end
end

def copy(head)
  return nil if head.nil?# || head.next.nil?
  copy_head = Node.new(nil, nil, nil)
  cur = head.next
  while cur
    temp = Node.new(cur.data, nil, nil)
    temp.next = cur.next
    cur.next = temp
    cur = temp.next
  end
  cur = head.next
  while cur
    cur.next.jump = cur.jump.next
    cur = cur.next.next
  end
  cur = head.next
  copy_head.next = cur.next
  while cur.next.next
    temp = cur.next.next
    cur.next.next = temp.next
    cur.next = temp
    cur = temp
  end
  cur.next = nil
  copy_head
end

a = Node.new("a", nil, nil)
b = Node.new("b", nil, nil)
c = Node.new("c", nil, nil)
d = Node.new("d", nil, nil)
a.next = b; b.next = c; c.next = d
a.jump = c; b.jump = d; c.jump = b; d.jump = d
head = Node.new(nil, a, nil)
puts head.print_list
puts
puts copy(head).print_list
puts
puts head.print_list
