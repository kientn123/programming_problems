=begin
 Implement a function to check if a tree is balanced (binary tree)
 For the purposes of this question, a balanced tree is defined to be a tree 
 such that no two leaf nodes differ in distance from the root by more than one 
=end


a_tree = {
  data: 2,
  left: {
    data: 4
  },
  right: {
    data: 7,
    left: {
      data: 6,
      right: {
        data: 10,
        left: {
          data: 15
        }
      }
    }
  }
}

class BalancedBinaryTree
  def is_balanced tree 
    (get_max_height tree) - (get_min_height tree) <= 1
  end
  
  def get_min_height tree 
    if tree.nil?
      0
    else
      1 + [(get_min_height tree[:left]), (get_min_height tree[:right])].min
    end     
  end
  
  def get_max_height tree 
    if tree.nil?
      0
    else
      1 + [(get_max_height tree[:left]), (get_max_height tree[:right])].max
    end
  end
end

manager = BalancedBinaryTree.new
puts manager.is_balanced a_tree
