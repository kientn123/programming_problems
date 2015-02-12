=begin
Find the first key larger than k in a BST
Write a function that takes a BST T and a key k, and returns the first entry larger than k
that would appear in an inorder traversal. If k is absent or no key larger than k is
present, return nil.
=end
def first_larger_than_k(root, k)
  return nil if root.nil?
  target = root
  k_present = false
  res = nil
  while target
    if target.data == k
      k_present = true
      target = target.right
    elsif target.data < k
      target = target.right
    else # target > k
      res = target
      target = target.left
    end
  end

  return k_present ? res : nil
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

puts first_larger_than_k(a, 23).name
puts first_larger_than_k(a, 32)
