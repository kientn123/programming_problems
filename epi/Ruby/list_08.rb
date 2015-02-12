=begin
Delete a node from a singly linked list
Let v be a node in a singly linked list L. Node v is not a tail, delete it in
O(1) time
=end
require "libraries"

def delete_node(node)
  node.data = node.next.data
  node.next = node.next.next
end

v = Node.new(3, Node.new(4, Node.new(5, nil)))
h = Node.new(nil, Node.new(1, Node.new(2, v)))
puts h.print_list
delete_node(v)
puts h.print_list
