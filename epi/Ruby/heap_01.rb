=begin
Design an algorithm that takes a set of files containing stock trades sorted
by increasing trade times, and writes a single file containing the trades
appearing in the indivisual file sorted in the same order. The algorithm should
use very little RAM, ideally of the order of a few kilobytes.
=end

include Java
import java.util.PriorityQueue
# Use a min-heap of size k where k is the number of files
# push the first element from each file to the heap
def merge(arrs)
  return [] if arrs.length == 0
  res = Array.new
  queue = PriorityQueue.new(1, Comp.new)
  0.upto(arrs.length-1) do |i|
    queue.add(Pair.new(value=arrs[i][0], set=i))
  end
  cur = Array.new(arrs.length, 0)
  until queue.size == 0
    top = queue.poll
    puts top
    res << top.value
    from_set = top.set
    if cur[from_set] + 1 < arrs[from_set].length
      cur[from_set] += 1
      queue.add(Pair.new(value=arrs[from_set][cur[from_set]], set=from_set))
    end
  end
  res
end

class Pair
  attr_accessor :value, :set
  def initialize(value, set)
    @value = value
    @set = set
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    "value: #{@value}, set: #{set}"
  end
end

class Comp
  def compare(pair1, pair2)
    pair1 <=> pair2
  end
end
arrs = [[1,5,8,9,12],
        [2,4,10,11,13],
        [3,6,7,14,15]]
puts merge(arrs).to_s
puts Pair.new(2,1) <=> Pair.new(1,2)
