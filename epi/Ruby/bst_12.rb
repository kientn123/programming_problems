=begin
Convert a BST to a sorted doubly linked list
=end
require "libraries"
def convert(root)
  head = TNode.new(nil)
  head.right = convert_helper(root)[:left]
  return head
end

def convert_helper(root)
  if root.nil?
    return {left: nil, right: nil}
  end
  if root.left.nil? && root.right.nil?
    return {left: root, right: root}
  end
  left = convert_helper(root.left)
  right = convert_helper(root.right)
  root.left = left[:right]
  root.right = right[:left]
  left[:right].right = root if left[:right]
  right[:left].left = root if right[:left]
  return {left: left[:left] ? left[:left] : root,
    right: right[:right] ? right[:right] : root}
end

def right_ward(head)
  res = []
  return res if head.nil?
  head = head.right
  while head
    res << head.data
    head = head.right
  end
  res
end

root = TNode.new(7)
root.left = TNode.new(3)
root.right = TNode.new(11)
root.left.left = TNode.new(2)
root.left.right = TNode.new(5)
head = convert(root)
puts right_ward(head).to_s
