=begin
Implement a queue API using 2 stacks
Your implementation should be efficient. The time to do a sequence of m
combined enqueues and dequeues should be O(m). O(1) additional storage other
than the 2 stacks
=end

class MyQueue
  def initialize
    @s1 = []
    @s2 = []
  end

  def dequeue
    return nil if @s1.empty? && @s2.empty?
    if @s2.empty?
      until @s1.empty?
        temp = @s1.pop
        @s2 << temp
      end
    end
    return @s2.pop
  end

  def enqueue(data)
    @s1 << data
  end
end

q = MyQueue.new
q.enqueue(1); q.enqueue(2); q.enqueue(3); q.enqueue(4); q.enqueue(5)
5.times do
  puts q.dequeue
end
