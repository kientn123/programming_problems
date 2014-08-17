=begin
Delete node in the middle of a singly linked list, given
only access to that node
=end

class LinkedList
  def self.delete(node)
    if node.next.nil?
      puts "No way"
    else
      node.data = node.next.data
      node.next = node.next.next
      puts "successful"
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
  def list
    runner = self
    to_print = ""
    while !runner.next.nil?
      runner = runner.next
      to_print << runner.data.to_s + ", "
    end
    to_print << "nil"
  end
end

to_be_deleted = Node.new(3, Node.new(4, Node.new(5, Node.new(6, nil))))
l = Node.new(nil, Node.new(1, Node.new(2, to_be_deleted)))
puts l.list
LinkedList.delete(to_be_deleted)
puts l.list
