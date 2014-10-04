=begin
determine if a singly linked list is cyclic
=end

class LinkedList
  def self.is_cyclic(l)
    if l.next.nil? or l.next.next.nil?
      return nil
    else
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
      return runner1
    end
  end
end

class Node
  attr_accessor(:data, :next)
  def initialize(data, node)
    @data = data; @next = node
  end
  def to_s
    @data.to_s
  end
end

l = Node.new(nil, Node.new(1, Node.new(2, Node.new(3, nil))))
tail = Node.new(8, nil)
start = Node.new(5, Node.new(6, Node.new(7, tail)))
tail.next = start
f = Node.new(nil, Node.new(1, Node.new(2, Node.new(3, Node.new(4, start)))))
puts LinkedList.is_cyclic(l)
