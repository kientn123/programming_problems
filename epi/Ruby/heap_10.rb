=begin
How would you implement a stack API using a heap and a queue API using a heap?
Specifically write peek(), push() and pop() for stack, and head(), enqueue()
and dequeue() for the queue
=end

include Java
import java.util.PriorityQueue

class Stack
  def initialize
    @order = 0
    @heap = PriorityQueue.new(1, Comp.new)
  end

  def push(e)
    @heap.add(Pair.new(@order, e))
    @order -= 1
  end

  def pop
    return "empty stack" if @heap.isEmpty
    @heap.poll.second
  end

  def peek
    @heap.peek.second
  end

  def to_s
    @heap.to_s
  end
end

class Queue
  def initialize
    @order = 0
    @heap = PriorityQueue.new(1, Comp.new)
  end

  def head
    @heap.peek.second
  end

  def enqueue(e)
    @heap.add(Pair.new(@order, e))
    @order += 1
  end

  def dequeue
    return "empty queue" if @heap.isEmpty
    @heap.poll.second
  end
end

class Pair
  attr_accessor(:first, :second)
  def initialize(first, second)
    @first = first
    @second = second
  end

  def <=>(other)
    @first <=> other.first
  end

  def to_s
    "(#{@first}, #{@second})"
  end
end

class Comp
  def compare(o1, o2)
    o1.first <=> o2.first
  end
end

puts Pair.new(0, 3) <=> Pair.new(-5, 11)
stack = Stack.new
stack.push(3); stack.push(5); stack.push(7)
stack.push(9); stack.push(11)
puts stack
puts stack.pop
puts stack.pop
puts stack.pop
puts stack.pop
q = Queue.new
q.enqueue(3); q.enqueue(5); q.enqueue(7)
puts q.dequeue()
puts q.dequeue()
