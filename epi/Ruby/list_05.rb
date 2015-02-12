=begin
determine if a singly linked list is cyclic
=end
require "libraries"

def is_cyclic(l)
  return nil if l.next.nil? or l.next.next.nil?
  runner1 = l
  runner2 = l
  while true
    if runner2.next.nil? or runner2.next.next.nil?
      return "nil"
    else
      runner1 = runner1.next
      runner2 = runner2.next.next
      if runner1 == runner2
        break
      end
    end
  end
  runner1 = l
  while runner1 != runner2
    runner1 = runner1.next
    runner2 = runner2.next
  end
  runner1
end

l = Node.new(nil, Node.new(1, Node.new(2, Node.new(3, nil))))
tail = Node.new(8, nil)
start = Node.new(5, Node.new(6, Node.new(7, tail)))
tail.next = start
f = Node.new(nil, Node.new(1, Node.new(2, Node.new(3, Node.new(4, start)))))
puts is_cyclic(l)
