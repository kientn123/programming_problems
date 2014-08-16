=begin
reverse a singly linked list O(n) time and O(1) space
=end

class LinkedList
  def self.reverse(l)
    if l.next.nil? or l.next.next.nil?
      return l
    else
      if l.next.next.next.nil?
        l.next.next.next = l.next
        l.next = l.next.next
        l.next.next.next = nil
        return l
      else
        a = l.next; b = a.next; c = b.next
        while !c.nil?
          b.next = a
          a = b; b = c; c = c.next
        end
        b.next = a
        l.next.next = nil
        l.next = b
        return l
      end
    end
  end
end

class Node
  attr_accessor(:data, :next)
  def initialize(data, node)
    @data = data; @next = node
  end

  def list
    runner = self
    to_print = ""
    while !runner.nil?
      to_print << runner.data.to_s + ", "
      runner = runner.next
    end
    to_print << "tail"
  end

  def to_s
    @data.to_s
  end
end

case3 = Node.new(nil, Node.new(2, Node.new(3, Node.new(4, Node.new(5, nil)))))
case1 = Node.new(nil, Node.new(1, nil))
case2 = Node.new(nil, Node.new(1, Node.new(2, nil)))

puts LinkedList.reverse(case3).list
