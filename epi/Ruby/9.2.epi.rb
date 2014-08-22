=begin
Given a root r of a binary tree, print all the keys at r
and its descendants. The keys should be printed in the order of
corresponding nodes'depths
=end
class Node
  attr_accessor(:left, :right, :data)
  def initialize(data)
    @data = data
  end

  def to_s
    data.to_s
  end
end

def print_tree(root)
  queue = Array.new
  queue << root
  num_at_depth = [1, 0]
  while queue.length != 0
    num_at_depth[0].times do
      target = queue.shift
      print target.to_s + " "
      if !target.left.nil?
        queue << target.left
        num_at_depth[1] += 1
      end
      if !target.right.nil?
        queue << target.right
        num_at_depth[1] += 1
      end
    end
    print "\n"
    num_at_depth[0], num_at_depth[1] = num_at_depth[1], 0
  end
end

one = Node.new(1); two = Node.new(2); three = Node.new(3)
one.left = two; one.right = three; three.right = Node.new(4)
print_tree(one)
