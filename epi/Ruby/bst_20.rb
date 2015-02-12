=begin
Test if a binary tree is a min-first BST
=end
require "libraries"
def contains(root, k)
  return false if root.nil?
  if root.data == k
    return true
  elsif root.data > k
    return false
  end
  if root.right.nil?
    return contains(root.left, k)
  else
    if k >= root.right.data
      return contains(root.right, k)
    else
      return contains(root.left, k)
    end
  end
end

root = TNode.new(2)
root.left = TNode.new(3)
root.right = TNode.new(13)
root.left.right = TNode.new(5)
root.left.right.left = TNode.new(7)
root.left.right.right = TNode.new(11)
root.right.left = TNode.new(17)
root.right.right = TNode.new(19)
root.right.right.left = TNode.new(23)

puts contains(root, 5)
puts contains(root, 20)
