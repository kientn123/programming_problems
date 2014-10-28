=begin
Two node of a BST are swapped. Correct the tree to regain the BST property
=end
def find_swapped_nodes(root)
  return if root.nil?
  first = [nil]; mid = [nil]; last = [nil]; prev = [nil]
  find_swapped_nodes_helper(root, first, mid, last, prev)
  if first[0] && last[0]
    return [first[0].data, last[0].data]
  elsif first[0] && mid[0]
    return [first[0].data, mid[0].data]
  else
    return nil
  end
end

def find_swapped_nodes_helper(root, first, mid, last, prev)
  if first[0] && last[0]
    return
  elsif root.nil?
    return
  else
    find_swapped_nodes_helper(root.left, first, mid, last, prev)
    if prev[0] && prev[0].data > root.data
      if first[0]
        last[0] = root
      else
        first[0] = prev[0]
        mid[0] = root
      end
    end
    prev[0] = root
    find_swapped_nodes_helper(root.right, first, mid, last, prev)
  end
end

def inorder(root)
  res = []
  inorder_helper(root, res)
  return res
end

def inorder_helper(root, res)
  if root.nil?
    return
  else
    inorder_helper(root.left, res)
    res << root.data
    inorder_helper(root.right, res)
  end
end

class Node
  attr_accessor(:data, :left, :right)
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

a = Node.new(10); b = Node.new(5); c = Node.new(8)
d = Node.new(2); e = Node.new(20)
a.left = b; a.right = c; b.left = d; b.right = e
puts find_swapped_nodes(a).to_s
