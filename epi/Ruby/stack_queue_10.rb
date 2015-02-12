=begin
Print a binary tree in order of increasing depth
Specifically, all keys corresponding to nodes at depth d should appear in a
single line, and the next line should correspond to keys corresponding to nodes
of depth d+1. You cannot use recursion
=end
require "libraries"

def print_tree(root)
  return if root.nil?
  q = []
  q << root
  size = q.length
  until q.empty?
    size.times do
      node = q.shift
      print node.data.to_s + " "
      q << node.left if node.left
      q << node.right if node.right
    end
    puts
    size = q.length
  end
end

a = TNode.new(19,"a"); b = TNode.new(7,"b"); c = TNode.new(3,"c")
d = TNode.new(2,"d"); e = TNode.new(5,"e"); f = TNode.new(11,"f")
g = TNode.new(17,"g"); h = TNode.new(13,"h"); i = TNode.new(43,"i")
j = TNode.new(23,"j"); k = TNode.new(37,"k"); l = TNode.new(29,"l")
m = TNode.new(31,"m"); n = TNode.new(41,"n"); o = TNode.new(47,"o");
q = TNode.new(53,"q")

a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e
f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n
l.right = m; i.right = o; o.right = q

print_tree(a)
