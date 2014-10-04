=begin
 Implement a MyQueue class which implements a queue using two stacks 
=end

class MyQueue
  def initialize
    @stack1 = []
    @stack2 = []
  end
  
  def enqueue(x)
    @stack1 << x
  end
  
  def dequeue
    if @stack2.length == 0
      while @stack1.length != 0
        @stack2 << @stack1.pop
      end
    end
    @stack2.pop
  end
  
  def to_s
    queue = @stack2.reverse
    queue += @stack1
    print queue
  end
end

my_queue = MyQueue.new
my_queue.enqueue(1)
my_queue.enqueue(2)
my_queue.enqueue(5)
my_queue.enqueue(10)
my_queue.dequeue()
puts my_queue