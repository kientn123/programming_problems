=begin
The nearest restaurant problem
How would ou efficiently perform a range query on a BST? Specifically, write a function that takes
as input a BST and a range [l, u] and returns a list of all the keys that lie in [l, u]
=end
def search_range(root, l, u)
  res = []
  search_range_helper(root, l, u, res)
  return res
end

def search_range_helper(root, l, u, res)
  if root.nil?
    return
  end

  if root.data >= l
    search_range_helper(root.left, l, u, res)
  end

  if root.data >= l && root.data <= u
    res << root.name
  end

  if root.data <= u
    search_range_helper(root.right, l, u, res)
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

puts search_range(a, 11, 37).to_s
