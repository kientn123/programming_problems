=begin
The input consists of a very long sequence of numbers. Each number is at most
k positions away from its correctly sorted position. Design an algorithm
that outputs the numbers in correct order and uses O( k ) storage, independent
of the number of elements processed
=end

include Java
import java.util.PriorityQueue

def sort( arr, k )
  return if arr.length == 0 || k > arr.length
  q = PriorityQueue.new
  0.upto( [arr.length-1, k].min ) do |i|
    q.add( arr[i] )
  end
  res = Array.new
  (k+1).upto( arr.length - 1 ) do |i|
    res << q.poll
    q.add( arr[i] )
  end
  until q.size == 0
    res << q.poll
  end
  res
end

arr = [3,1,4,2,7,5,6]
puts sort( arr, 2 ).to_s
