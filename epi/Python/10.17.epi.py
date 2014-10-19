# Implement locking in a binary tree
# This problem is concerned with the design of an API for setting the state of
# nodes in a binary tree to lock or unlock. A node's state cannot be set to
# lock if any of its descendants or ancestors are in lock.
# Changing a node's state to lock does not change the state of any other nodes.
# For example, all leaves my simultaneously be in state lock. (If this is the
# case, no nonleaf nodes can be in state lock)
class Node():
