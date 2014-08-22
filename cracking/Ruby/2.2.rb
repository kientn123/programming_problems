=begin
Implement an algorithm to find the nth to laste element to a singly
linked list
=end

class LinkedList
  def self.find_nth_to_last(head, n)
    previous = head.next
    tail = previous
    (n-1).times do
      tail = tail.next
    end
    while !tail.next.nil?
      tail = tail.next
      previous = previous.next
    end
    previous
  end
end

class Node
  attr_accessor(:next, :data)
  def initialize(data)
    @data = data
    #@next = next
  end

  def to_s
    @data.to_s
  end
end

head = Node.new(nil)
one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)
head.next = one; one.next = two; two.next = three
three.next = four; four.next = five; five.next = six

puts LinkedList.find_nth_to_last(head, 4)
