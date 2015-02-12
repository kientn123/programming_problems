=begin
Compute the median of a sorted circular linked list
Write a function that takes a pointer to an arbitrary node in a sorted circular
linked list, and returns the median of the linked list
=end
require "libraries"

def median(head)
  return nil if head.nil? || head.next.nil?
  largest = nil
  count = 0
  cur = head.next
  loop do
    count += 1
    largest = cur if cur.data > cur.next.data
    cur = cur.next
    break if cur == head.next
  end
  # now largest contains the biggest number in the sequence
  median = largest
  puts "largest: " + largest.to_s
  puts "count: " + count.to_s
  (count/2.0).ceil.times do
    median = median.next
  end
  if count % 2 == 1
    puts "count is odd"
    return median.data
  else
    puts "count is even"
    return (median.data + median.next.data) / 2.0
  end
end

b = Node.new(1, nil)
a = Node.new(2, Node.new(3, Node.new(4, Node.new(5, b))))
b.next = a
head = Node.new(nil, a)
puts median(head)
