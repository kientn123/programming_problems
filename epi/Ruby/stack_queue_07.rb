=begin
Search a postings list
One way to enumerate the nodes in a postings list is to iteratively follow
the next field. Another is to always first follow the jump field if it leads
to a node that has not been explored previously, and then search from the next
node. Call the order in which these nodes are traversed the jump-first order.

Write recursive and iterative routines that take a postings list, and computes
the jump-first order. Assume each node has an order field, which is an integer
that is initialized to -1 for each node.
=end
