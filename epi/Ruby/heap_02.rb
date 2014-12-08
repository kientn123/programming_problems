=begin
An array A of n integers is said to be k-increasing-decreasing if elements
repeatedly increase up to a certain index after which they decrease, then
again increase, a total of k times.
Design an efficient algorithm for sorting a k-increasing-decreasing array.
You are given another array of the same size that the result should be
written to, and you can use O( k ) additional storage.
=end
include Java
import java.util.PriorityQueue

def solve( arr )
  return if arr.length <= 1
  k_list = Array.new
  start = 0
  increasing = arr[1] > a[0]
  2.upto( arr.length - 1 ) do |i|
    if arr[i] < arr[i-1] && increasing
      k_list << { start: start, last: i-1 }
      start = i
      increasing = !increasing
    elsif arr[i] > arr[i-1] && !increasing
      k_list << { start: start, last: i-1 }
      start = i
      increasing = !increasing
    end
  end
  k_list << { start: start, last: arr.length - 1 }

  q = PriorityQueue.new( 1, Comp.new )
  0.upto( k_list.length - 1 ) do |i|
    q.add( Pair.new( ))
  end
end

class Pair
  attr_accessor( :value, :from_set )
  def initialize( value, from_set )
    @value = value
    @from_set = from_set
  end
end

class Comp
  def compare( one, another )
    one.value <=> another.value
  end
end
