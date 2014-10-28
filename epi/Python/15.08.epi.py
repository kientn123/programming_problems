# The most visited pages problem
# You are to implement methods to analyse log file data to find the most visited pages.
# Specifically, implement the following methods:
# - void add(Entry p) - add p.page to the set of visited pages. It is guaranteed that if
#   add(q) is called after add(p) then q.timestamp is greater than or equal to p.timestamp
# - List<String> common(k) - return a list of the k most common pages
# First solve problem when common(k) is called exactly once after all pages have been read.
# Then solve the problem when calls to common and add interleaved. Assume you have limited
# RAM
class BST():
    def __init__(self):
        self.root = None

    def add(self, p):
        if self.root:
            prev = None
            curr = self.root
            direction = None
            while curr:
                prev = curr
                if curr < p:
                    curr = curr.right
                    direction = "right"
                else:
                    curr = curr.left
                    direction = "left"
            if direction = "left":
                prev.left = p
            else:
                prev.right = p
        else:
            self.root = p

    def remove(self, p):
        if self.root:
            prev = None
            curr = self.root
            
