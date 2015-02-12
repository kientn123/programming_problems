=begin
Test if a binary tree satisfies the BST property
BST property: the key stored at a node is greater than or equal to the keys stored at the
nodes of its left subtree and less than or equal to the keys stored in the nodes of its
right subtree.
=end
def is_binary_tree(root)
  return is_binary_tree_helper(root, -Float::INFINITY, Float::INFINITY)
end

def is_binary_tree_helper(root, lower, upper)
  if root.nil?
    return true
  elsif root.data < lower || root.data > upper
    return false
  else
    is_binary_tree_helper(root.left, lower, root.data) &&
      is_binary_tree_helper(root.right, root.data, upper)
  end
end

class Node
  attr_accessor(:data, :left, :right, :name)
  def initialize(data, name)
    @data = data; @name = name
    @left = nil; @right = nil
  end
end

a = Node.new(19,"a"); b = Node.new(7,"b"); c = Node.new(3,"c")
d = Node.new(2,"d"); e = Node.new(5,"e"); f = Node.new(11,"f")
g = Node.new(17,"g"); h = Node.new(13,"h"); i = Node.new(43,"i")
j = Node.new(23,"j"); k = Node.new(37,"k"); l = Node.new(29,"l")
m = Node.new(31,"m"); n = Node.new(41,"n"); o = Node.new(47,"o");
q = Node.new(53,"q")

a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e
f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n
l.right = m; i.right = o; o.right = q

puts is_binary_tree(a)
