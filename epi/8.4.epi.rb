=begin
Copy a posting list
=end

class Node
  attr_accessor(:data, :next, :jump)
  def initialize(data, node_next, node_jump)
    @data = data
    @next = node_next
    @jump = node_jump
  end

  def to_s
    if !@next.nil?
      to_print_next = @next.data
    else
      to_print_next = "nil"
    end

    "data: " + data.to_s + "; next: " + to_print_next\
     + "; jump: " + @jump.data.to_s
  end

  def list
    runner = self
    while !runner.next.nil?
      runner = runner.next
      puts runner
    end
  end
end

class LinkedList
  def self.copy(l)
    f = Node.new(nil, nil, nil)
    runner_f = f
    runner_l = l
    while !runner_l.next.nil?
      runner_l = runner_l.next
      puts runner_l
      node_copy = Node.new(runner_l.data, nil, runner_l)
      runner_f.next = node_copy
      runner_f = runner_f.next
    end
    runner_f = f
    while !runner_f.next.nil?
      runner_f = runner_f.next
      runner_f.jump.next = runner_f
    end

    runner_f = f
    while !runner_f.next.nil?
      runner_f = runner_f.next
      runner_f.jump = runner_f.jump.jump.next
    end
    f
  end
end

l = Node.new(nil, nil, nil)
a = Node.new('a', nil, nil)
b = Node.new('b', nil, nil)
c = Node.new('c', nil, nil)
d = Node.new('d', nil, nil)
l.next = a; a.next = b; b.next = c; c.next = d
a.jump = c; b.jump = d; c.jump = b; d.jump = d
#l.list
f = LinkedList.copy(l)
f.list
