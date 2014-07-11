=begin
 Given a sorted array (increasing order), write an algorithm to create a binary tree with minimal height 
=end
# Model of a tree
tree = {
  data: 4, 
  left: {
    data: 3
  },
  right: {
    data: 8
  }
}

class CreateBinarySearchTree
  def self.create array
    if array.nil? || array.length == 0
      nil
    elsif 
      parent = {
        data: array[array.length/2]
      }
      if array[0, array.length/2].length != 0
        parent[:left] = create array[0, array.length/2]
      end
      if array[array.length/2+1, array.length].length != 0
        parent[:right] = create array[array.length/2+1, array.length]
      end
      parent 
    end
  end
end

puts CreateBinarySearchTree.create [1, 2, 3, 4, 5, 6, 7, 8]
