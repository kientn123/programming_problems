# Implement locking in a binary tree
# This problem is concerned with the design of an API for setting the state of
# nodes in a binary tree to lock or unlock. A node's state cannot be set to
# lock if any of its descendants or ancestors are in lock.
# Changing a node's state to lock does not change the state of any other nodes.
# For example, all leaves my simultaneously be in state lock. (If this is the
# case, no nonleaf nodes can be in state lock)
class Node():
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
        self.parent = None
        self.locked = False
        self.num_children_locked = 0

    def is_locked(self):
        return self.locked

    def unlock(self):
        if self.is_locked():
            self.locked = False
            n = self.parent
            while n:
                n.num_children_locked -= 1
                n = n.parent
            print "successfully unlocked "+str(self.data)
        else:
            print str(self.data) + " is not locked"

    def lock(self):
        def has_ancestor_locked(node):
            if node == None:
                return False
            if node.is_locked():
                return True
            return has_ancestor_locked(node.parent)

        if has_ancestor_locked(self) or self.num_children_locked > 0:
            print "cannot change the state to lock "+str(self.data)
        else:
            print "ok to lock: " + str(self.data)
            self.locked = True
            n = self.parent
            while n:
                n.num_children_locked += 1
                n = n.parent

if __name__ == "__main__":
    a = Node(314); b = Node(6); c = Node(271)
    d = Node(28); e = Node(0); f = Node(561)
    g = Node(3); h = Node(17); i = Node(6)
    j = Node(2); k = Node(1); l = Node(401)
    m = Node(641); n = Node(257); o = Node(271); p = Node(28)

    a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e;
    f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n;
    l.right = m; i.right = o; o.right = p;

    b.parent = a; i.parent = a; c.parent = b; f.parent = b; j.parent = i
    o.parent = i; d.parent = c; e.parent = c; g.parent = f; h.parent = g
    k.parent = j; l.parent = k; n.parent = k; m.parent = l; p.parent = o

    j.lock();
    a.lock();
    l.lock();
    j.unlock();
    a.lock();
    l.lock();
