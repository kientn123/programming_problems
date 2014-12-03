include Java

import java.util.Comparator
import java.util.PriorityQueue
#
# class Greater
#   def compare(a, b)
#     a <=> b
#   end
# end
#
# q = PriorityQueue.new(1, Greater.new)
q = PriorityQueue.new
q.add(10)
q.add(15)
q.add(5)
puts q.poll
puts q.poll
puts q.poll
