# Let h1 and h2 be the heads of lists L1 and L2, respectively. Assume that L1
# & L2 are well-formed, that is each consists of a finite sequence of nodes.
# How would you determine if there exists a node r reachable from both h1 and
# h2 by following the next fields? If such a node exists, find the node that
# appears earliest when traversing the lists. You are constrained to use no
# more than constant additional storage.

def common_node(h1, h2):
    h1_last = find_last(h1)
    h2_last = find_last(h2)
    if h1_last["last"] != h2_last["last"]:
        return None
    distance = abs(h1_last["length"]-h2_last["length"])
    if h1_last["length"] > h2_last["length"]:
        h1 = move_by_k(h1, distance)
    else:
        h2 = move_by_k(h2, distance)
    while True:
        if h1 == h2:
            return h1
        h1 = h1.next
        h2 = h2.next

def find_last(head):
    cur = head
    count = 0
    while cur.next:
        cur = cur.next
        count += 1
    return {"length": count, "last": cur}

def move_by_k(head, k):
    for _ in xrange(k):
        head = head.next
    return head


class Node():
    def __init__(self, data, node):
        self.data = data
        self.next = node

if __name__ == "__main__":
    com = Node(4, Node(5, None))
    h1 = Node(None, Node(1, Node(2, com)))
    h2 = Node(None, Node(3, com))
    print com == common_node(h1, h2)
