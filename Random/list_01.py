# https://oj.leetcode.com/problems/swap-nodes-in-pairs/
# Given a linked list, swap two adjacent nodes and return its head
# Your algorithm should use only constant space. You may not modify the values
# in the list, only next pointers can be changed.
from libraries import Node

def swap_pairs(head):
    if head == None or head.next == None:
        return head
    cur = head
    res = None
    prev = None
    while cur and cur.next:
        temp = cur.next.next
        cur.next.next = cur
        if cur == head:
            res = cur.next
        if prev:
            prev.next = cur.next
        cur.next = temp
        prev = cur
        cur = cur.next
    return res

if __name__ == "__main__":
    head = Node(1, Node(2, Node(3, Node(4, None))))
    print head.linkedlist()
    new_head = swap_pairs(head)
    print new_head.linkedlist()
