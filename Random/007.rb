=begin
Given the binary tree and two nodes a and b, determine whether the two nodes are
cousins of each other
Two nodes are cousins if they are at the same level and have different parents
http://www.geeksforgeeks.org/check-two-nodes-cousins-binary-tree/
=end
def are_cousins(root, a, b)
  if a == root || b == root || root == nil
    return false
  end

  a_info = find(root, a)
  b_info = find(root, b)
  puts a_info.to_s, b_info.to_s
  if a_info[:level] == b_info[:level] && a_info[:parent] != b_info[:parent]
    return true
  end
  return false
end

def find(root, a)
  res = {level: 0, parent: nil}
  find_helper(root, a, res, 0)
  return res
end

def find_helper(root, a, res, level)
  if res[:parent]
    return
  end

  if root.nil?
    return
  end

  if root.left == a || root.right == a
    res[:parent] = root
    res[:level] += level + 1
  end

  find_helper(root.left, a, res, level+1)
  find_helper(root.right, a, res, level+1)
end

class Node
  attr_accessor(:data, :left, :right)
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

a = Node.new(6); b = Node.new(3); c = Node.new(5); d = Node.new(7)
e = Node.new(8); f = Node.new(1); g = Node.new(3)
a.left = b; a.right = c; b.left = d; b.right = e
c.left = f; c.right = g

puts are_cousins(a, d, f)
puts are_cousins(a, d, e)
