=begin
L and F are ascending order singly linked list. Merge them together
using only O(1) space
=end

class LinkedList
  def self.merge(first, second)
    m = Node.new(nil, nil)
    runner = m
    l = first.next; f = second.next
    while f && l
      if l.data < f.data
        runner.next = l
        l = l.next
      else
        runner.next = f
        f = f.next
      end
      runner = runner.next
    end
    while f
      runner.next = f; f = f.next; runner = runner.next
    end
    while l
      runner.next = l; l = l.next; runner = runner.next
    end
    m
  end
end

class Node
  attr_accessor(:data, :next)
  def initialize(data, node)
    @data = data
    @next = node
  end

  def to_s
    runner = self
    to_print = ""
    while runner
      to_print << runner.data.to_s + ", "
      runner = runner.next
    end
    to_print << "nil"
  end
end

first = Node.new(nil, Node.new(1, Node.new(2, Node.new(5, Node.new(7, nil)))))
second = Node.new(nil, Node.new(3, Node.new(11, nil)))
m = LinkedList.merge(first, second)
puts m
