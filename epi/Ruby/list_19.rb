=begin
Add list-based integers
Write a function which takes two singly linked lists of digits, and returns
the list corresponding to the sum of the integers they represent. The least
significant digit comes first
=end
require "libraries"

# Make a whole new list to store the result of addition
def add(h1, h2)
  return h1 if h2.nil? || h2.next.nil?
  return h2 if h1.nil? || h1.next.nil?

  head = Node.new(nil, nil)
  cur = head
  carry_on = 0
  r1 = h1.next
  r2 = h2.next
  while r1 && r2
    sum = r1.data + r2.data + carry_on
    cur.next = Node.new(sum%10, nil)
    carry_on = sum/10
    cur = cur.next
    r1 = r1.next
    r2 = r2.next
  end
  while r1
    sum = r1.data + carry_on
    cur.next = Node.new(sum%10, nil)
    carry_on = sum/10
    cur = cur.next
    r1 = r1.next
  end
  while r2
    sum = r2.data + carry_on
    cur.next = Node.new(sum%10, nil)
    carry_on = sum/10
    cur = cur.next
    r2 = r2.next
  end
  if carry_on > 0
    cur.next = Node.new(1, nil)
  end
  head
end

# Use the first list to store the result. Pretty cool
def add_2(h1, h2)
  return nil if h1.nil? || h2.nil?
  r1 = h1
  r2 = h2.next
  carry_on = 0
  while r1.next && r2
    sum = r1.next.data + r2.data + carry_on
    r1.next.data = sum % 10
    carry_on = sum / 10
    r1 = r1.next
    r2 = r2.next
  end
  r1.next = r2 if r2
  while r1.next
    sum = r1.next.data + carry_on
    r1.next.data = sum % 10
    carry_on = sum / 10
    r1 = r1.next
  end
  r1.next = Node.new(1, nil) if carry_on == 1
  h1
end

h1 = Node.new(nil, Node.new(3, Node.new(1, Node.new(4, nil))))
h2 = Node.new(nil, Node.new(7, Node.new(0, Node.new(9, Node.new(9, Node.new(9, nil))))))
puts add(h1, h2).print_list
puts add_2(h2, h1).print_list
puts h1.print_list
