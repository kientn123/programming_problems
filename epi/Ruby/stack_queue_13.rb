=begin
Implement a queue with max API
How would you implement a queue so that any series of m combined enqueue,
dequeue, and max operations can be done in O(m) time
=end

include Java
import java.util.LinkedList

class MaxQueue
  def initialize
    @q = LinkedList.new
    @d = LinkedList.new
  end

  def enqueue(data)
    @q.addLast(data)
    until @d.empty? || @d.peekLast >= data
      @d.pollLast
    end
    @d.addLast(data)
  end

  def dequeue
    temp = @q.pollFirst
    @d.pollFirst if temp == @d.peekFirst
  end

  def max
    @d.peekFirst
  end
end

mq = MaxQueue.new
mq.enqueue(1)
puts mq.max
mq.enqueue(3)
puts mq.max
mq.enqueue(2)
puts mq.max
mq.enqueue(1)
mq.dequeue
mq.dequeue
puts mq.max
mq.enqueue(4)
puts mq.max
