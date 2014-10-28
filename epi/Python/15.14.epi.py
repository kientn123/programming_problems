# Design efficient functions for inserting and removing keys in a BST. Assume that all elements
# in the BST are unique, and that your insertion method must preserve this property. You cannot
# change the contents of any code. What are the time complexities of your functions
class BST():
    def __init__(self):
        self.root = None

    def insert(self, p):
        if self.root == None:
            self.root = Node(p)
        else:
            curr = self.root
            while curr:
                if curr.data < p:
                    if curr.right:
                        curr = curr.right
                    else:
                        curr.right = Node(p)
                        break
                elif curr.data > p:
                    if curr.left:
                        curr = curr.left
                    else:
                        curr.left = Node(p)
                        break
                else:
                    break

    def remove(self, p):
        if self.root == None:
            return None
        else:
            prev = None
            curr = self.root
            while curr:
                if curr.data < p:
                    prev = curr
                    curr = curr.right
                elif curr.data > p:
                    prev = curr
                    curr = curr.left
                else:
                    break
        if curr:
            replace = None
            if curr.left and curr.right == None:
                replace = curr.left
            elif curr.right and curr.left == None:
                replace = curr.right
            elif curr.left and curr.right:
                pred = self.predecessor(curr)
                replace = self.remove(pred.data)
                replace.right = curr.right
                replace.left = curr.left
            if prev:
                if prev.left == curr:
                    prev.left = replace
                else:
                    prev.right = replace
            else:
                self.root = replace
        return curr

    def predecessor(self, curr):
        if curr.left == None:
            return None
        res = curr.left
        while res.right:
            res = res.right
        return res

class Node():
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

if __name__ == "__main__":
    bst = BST()
    bst.insert(17)
    bst.insert(5)
    bst.insert(2)
    bst.insert(11)
    bst.insert(23)
    print bst.root.data
    print bst.root.left.data
    print bst.root.right.data
    print bst.root.left.left.data
    print bst.root.left.right.data
    print bst.root.right.right
    bst.remove(5)
    print bst.root.left.data
