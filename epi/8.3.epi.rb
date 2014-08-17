=begin
determine if a singly linked list is cyclic
=end

class LinkedList
  def self.is_cyclic(l)
    if l.next.nil?
      return "nil"
    else
      start = l.next
      runner = start
      while true
        runner = runner.next
        if runner.nil?
          return "nil"
        elsif runner == start
          return start
        else
          next
        end
      end
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
f = Node.new(nil, start)
puts LinkedList.is_cyclic(f)
