=begin
Given a BST node r, print all keys at r and its descendants. The nodes should
be printed in sorted order, and you cannot use recursion.
=end
require "libraries"

def nodes_in_order(root)
  return nil if root.nil?
  stack = []
  res = []
  stack << { node: root, ok: false }
  until stack.empty?
    top = stack.pop
    if top[:ok]
      res << top[:node].data
    else
      stack << { node: top[:node].right, ok: false } if top[:node].right
      stack << { node: top[:node], ok: true }
      stack << { node: top[:node].left, ok: false } if top[:node].left
    end
  end
  res
end

def nodes_in_order_2(root)
  return nil if root.nil?
  stack = []
  res = []
  cur = root
  until stack.empty? && cur.nil?
    if cur
      stack << cur
      cur = cur.left
    else
      top = stack.pop
      res << top.data
      cur = top.right
    end
  end
  res
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

puts nodes_in_order(a).to_s
puts nodes_in_order_2(a).to_s
