=begin
Find the first occurrence of k in a BST
Search for a node containing key k in a BST that appears first in inorder traversal.
If k is absent, return nil
=end
# Recursive approach
def first_appearence_k(root, k)
  return nil if root.nil?
  if root.data == k
    node = first_appearence_k(root.left, k)
    return node ? node : root
  elsif root.data < k
    return first_appearence_k(root.right, k)
  else
    return first_appearence_k(root.left, k)
  end
end

# Iterative approach
def first_appearence_k_v2(root, k)
  target = root
  res = nil
  while target
    if target.data == k
      res = target
      target = target.left
    elsif target.data < k
      target = target.right
    else
      target = target.left
    end
  end

  return res
end

class Node
  attr_accessor(:data, :name, :left, :right)
  def initialize(data, name)
    @data = data; @name = name
    @left = nil; @right = nil
  end

  def to_s
    return @name
  end
end

a = Node.new(108,"a"); b = Node.new(108,"b"); c = Node.new(-10,"c")
d = Node.new(-14,"d"); e = Node.new(2,"e"); f = Node.new(108,"f")
g = Node.new(285,"g"); h = Node.new(243,"h"); i = Node.new(285,"i")
j = Node.new(401,"j")

a.left = b; a.right = g; b.left = c; b.right = f; c.left = d; d.right = e
g.left = h; g.right = i; i.right = j

puts first_appearence_k(a, 108)
puts first_appearence_k_v2(a, 108)
puts first_appearence_k(a, 285)
puts first_appearence_k_v2(a, 285)
puts first_appearence_k(a, 143)
puts first_appearence_k_v2(a, 143)
