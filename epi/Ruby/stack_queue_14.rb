=begin
Compute the maximum of a sliding window
Let A be an array of length n, and w the window size. Entry A[i] is a pair
(ti, vi), where ti is the timestamp and vi is the traffic volume at that time.
Assume A is sorted by increasing timestamp. Design an algorithm to compute
vi = max{vj|(ti - tj) <= w, j<=i}, for 0 <= i <= n-1
=end

include Java
import java.util.LinkedList

def max_sliding(arr, w)
  q = MaxQueue.new
  res = Array.new
  0.upto(arr.length-1) do |i|
    q.enqueue(arr[i])
    while arr[i].timestamp - q.peekFirst.timestamp > w
      q.dequeue
    end
    res << q.max.volume
  end
  res
end

class Pair
  attr_accessor(:timestamp, :volume)
  def initialize(timestamp, volume)
    @timestamp = timestamp
    @volume = volume
  end

  def >=(other)
    @volume >= other.volume
  end
end

class MaxQueue
  def initialize
    @q = LinkedList.new
    @d = LinkedList.new
  end

  def enqueue(data)
    @q.addLast(data)
    until @d.empty? || @d.peekLast >= data
      @d.pollLast
    end
    @d.addLast(data)
  end

  def dequeue
    temp = @q.pollFirst
    @d.pollFirst if temp == @d.peekFirst
  end

  def max
    @d.peekFirst
  end

  def peekFirst
    @q.peekFirst
  end
end

arr = [Pair.new(0,7), Pair.new(1,5), Pair.new(3,6), Pair.new(4,1),
       Pair.new(5,4), Pair.new(7,10), Pair.new(8,3), Pair.new(9,1),
       Pair.new(10,2)]

puts max_sliding(arr, 3).to_s
