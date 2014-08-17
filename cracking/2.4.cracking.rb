=begin
Add two numbers, which are represented as linked lists
=end

class LinkedList
  def self.sum(l, f)
    s = Node.new(nil, nil)
    carry_on = 0
    runner_l = l; runner_f = f
    runner_s = s
    while !runner_l.next.nil? and !runner_f.next.nil?
      runner_l = runner_l.next
      runner_f = runner_f.next
      pure_sum = runner_l.data + runner_f.data + carry_on
      add_l_f = Node.new((pure_sum) % 10, nil)
      carry_on = pure_sum / 10
      runner_s.next = add_l_f
      runner_s = runner_s.next
    end

    while !runner_l.next.nil?
      runner_l = runner_l.next
      pure_sum = runner_l.data + carry_on
      add_l_f = Node.new(pure_sum % 10, nil)
      carry_on = pure_sum / 10
      runner_s.next = add_l_f
      runner_s = runner_s.next
    end

    while !runner_f.next.nil?
      runner_f = runner_f.next
      pure_sum = runner_f.data + carry_on
      add_l_f = Node.new(pure_sum % 10, nil)
      carry_on = pure_sum / 10
      runner_s.next = add_l_f
      runner_s = runner_s.next
    end
    if carry_on == 1
      runner_s.next = Node.new(1, nil)
    else
      runner_s.next = nil
    end
    s
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
      to_print << runner.to_s + "-> "
    end
    to_print << "nil"
  end
end

l = Node.new(nil, Node.new(3, Node.new(5, Node.new(5, Node.new(9, \
  Node.new(9, Node.new(9, nil)))))))
f = Node.new(nil, Node.new(6, Node.new(9, Node.new(6, nil))))
puts l.list
puts f.list
s = LinkedList.sum(l, f)
puts s.list
