=begin
Reconstruct a BST from traversal data
Which traversal orders - inorder, preorder, and postorder - of a BST can be used to
reconstruct a BST uniquely?
=end
def reconstruct_tree(preorder)
  return tree_helper(preorder, 0, preorder.length - 1)
end

def tree_helper(preorder, start, last)
  return nil if start > last
  root = preorder[start]
  last_node_on_left_subtree = start
  (start+1).upto(last) do |i|
    if preorder[i].data > root.data
      last_node_on_left_subtree = i-1
      break
    end
  end
  root.left = tree_helper(preorder, start + 1, last_node_on_left_subtree)
  root.right = tree_helper(preorder, last_node_on_left_subtree + 1, last)
  return root
end

def render_preorder(root)
  res = []
  render_preorder_helper(root, res)
  return res
end

def render_preorder_helper(root, res)
  return if root.nil?
  res << root.name
  render_preorder_helper(root.left, res)
  render_preorder_helper(root.right, res)
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

puts render_preorder(a).to_s
preorder = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, q]
tree = reconstruct_tree(preorder)
puts render_preorder(tree).to_s
