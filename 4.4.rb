=begin
 Given a binary search tree, design an algorithm which creates a linked list of all the nodes at each depth 
=end

# Idea: Of course: breadth-first-search would perfectly be a solution

a_tree = {
  data: 5,
  left: {
    data: 3,
    left: { data: 2 },
    right: { data: 4 }
  },
  right: {
    data: 7,
    left: { data: 6 },
    right: { data: 8 }
  }
}

linked_list = {
  data: a_tree,
  next: {
    data: a_tree[:left]
  }
}

puts linked_list
=begin
class LevelTraversal
  def self.create_linked_lists(root)
    if root.nil? 
      return
    else
      result = []
      result[0] = root
      level = 0
      while true
        
      end
    end
  end
  
  def add(queue, i, node)
    current = queue[i]
    while !queue[i].next.nil?
      current = current[:next]
    end 
    current[:next] = node 
  end
end
=end