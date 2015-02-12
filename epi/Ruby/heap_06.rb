=begin
Compute the k largest elements in a max-heap
Given a max-heap on n elements, represented as an array A, design an algorithm
that computes the k largest elements stored in A. You cannot modify the heap
=end

include Java
import java.util.PriorityQueue

def k_largest_in_heap(arr, k)
  if k > arr.length
    return "invalid input"
  end
  res = Array.new
  queue = PriorityQueue.new(1, Comp.new)
  queue.add(Pair.new(0, arr[0]))
  k.times do
    top = queue.poll
    res << top.second
    index = top.first
    queue.add(Pair.new(2*index + 1, arr[2*index + 1])) if 2*index + 1 < arr.length
    queue.add(Pair.new(2*index + 2, arr[2*index + 2])) if 2*index + 2 < arr.length
  end
  return res
end

class Comp
  def compare(this, that)
    that.second <=> this.second
  end
end

class Pair
  attr_accessor(:first, :second)
  def initialize(first, second)
    @first = first
    @second = second
  end
end

arr = [10, 8, 5, 7, 3, 4, 2, 6]
puts k_largest_in_heap(arr, 4).to_s
