=begin
Compute the LCA in a BST
Design an algorithm that takes a BST T of size n and height h, nodes s and b, and returns
the LCA of s and b. Assume s.key < b.key. Your algorithm should run in O(h) time and O(1)
space. Nodes don't have pointers to their parents
=end
def lca(root, s, b)
  target = root
  while target
    if target.data >= s.data && target.data <= b.data
      return target
    elsif target.data <= s.data
      target = target.right
    else
      target = target.left
    end
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

puts lca(a, c, g).name
