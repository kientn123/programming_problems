class Node
  attr_accessor(:data, :next)
  def initialize(data, node)
    @data = data; @next = node
  end

  def print_list
    runner = self
    to_print = "L -> "
    while runner.next
      runner = runner.next
      to_print << runner.data.to_s + " -> "
    end
    to_print << "tail"
  end

  def to_s
    @data.to_s
  end
end

class TNode
  attr_accessor(:data, :left, :right, :name)
  def initialize(data)
    @data = data; @name = nil
    @left = nil; @right = nil
  end

  def in_order
    res = Array.new
    in_order_helper(self, res)
    res
  end

  def in_order_helper(root, res)
    unless root.nil?
      in_order_helper(root.left, res)
      res << root.data
      in_order_helper(root.right, res)
    end
  end

  def pre_order
    res = Array.new
    pre_order_helper(self, res)
    res
  end

  def pre_order_helper(root, res)
    unless root.nil?
      res << root.data
      pre_order_helper(root.left, res)
      pre_order_helper(root.right, res)
    end
  end
end

class DNode
  attr_accessor(:data, :prev, :next)
  def initialize(data)
    @data = data
    @prev = nil
    @next = nil
  end

  def in_order_as_tree
    res = Array.new
    in_order_helper(self, res)
    res
  end

  def in_order_helper(root, res)
    unless root.nil?
      in_order_helper(root.prev, res)
      res << root.data
      in_order_helper(root.next, res)
    end
  end

  def pre_order_as_tree
    res = Array.new
    pre_order_helper(self, res)
    res
  end

  def pre_order_helper(root, res)
    unless root.nil?
      res << root.data
      pre_order_helper(root.prev, res)
      pre_order_helper(root.next, res)
    end
  end
end
