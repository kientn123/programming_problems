=begin
Build BST from a sorted array
=end
require "libraries"

def build_tree(arr)
  helper(arr, 0, arr.length-1)
end

def helper(arr, left, right)
  return nil if left > right
  mid = (left + right) / 2
  root = TNode.new(arr[mid])
  root.left = helper(arr, left, mid-1)
  root.right = helper(arr, mid+1, right)
  root
end

root = build_tree([1,2,3,4,5])
puts root.pre_order.to_s
puts root.in_order.to_s
