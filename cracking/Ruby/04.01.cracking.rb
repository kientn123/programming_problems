=begin
 Implement a function to check if a tree is balanced (binary tree)
 For the purposes of this question, a balanced tree is defined to be a tree 
 such that no two leaf nodes differ in distance from the root by more than one 
=end

def is_balanced(tree) 
  get_max_height(tree) - get_min_height(tree) <= 1
end

def get_min_height(tree) 
  if tree.nil?
    0
  else
    1 + [(get_min_height(tree[:left]), get_min_height(tree[:right])].min
  end     
end

def get_max_height(tree)
  if tree.nil?
    0
  else
    1 + [get_max_height(tree[:left]), get_max_height(tree[:right])].max
  end
end

class Node
  attr_accessor(:data, :right, :left)
  def initialize(data)
    @data = data
  end

  def to_s
    @data.to_s
  end

  def print_tree
    queue = [self]
    until queue.length == 0
      target = queue.shift
      
    end
  end
end
