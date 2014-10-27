=begin
Find the k largest elements in a BST
Given a root of a BST and an integer k, design a function that finds the k largest elements
in this BST.
=end
def k_largest_elements(root, k)
  return nil if root.nil?
  res = Array.new
  helper(root, k, res)
  return res
end

def helper(root, k, res)
  if root.nil? || res.length == k
    return
  else
    helper(root.right, k, res)
    return if res.length == k
    res << root.data
    helper(root.left, k, res)
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

puts k_largest_elements(a, 5).to_s
