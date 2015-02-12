=begin
Compute buildings with a sunset view
You're given a series of buildings that have windows facing west. The buildings
are in a straight line, and if a building b is to the east of a building whose
height is greater than or equal to b, it is not possible to view the sunset
from b

Design an algorithm that processes buildings presented in an online fashion,
and records the buildings that have a view of the sunset. The number of
buildings is not known in advance. Buildings are given in east-to-west order
and are specified by their heights. Minimize the amount of memory your
algorithm uses.
=end

def sunset_buildings(buildings)
  stack = []
  buildings.each do |e|
    if stack.empty? || e < stack[-1]
      stack << e
    else
      until stack.empty? || stack[-1] > e
        stack.pop
      end
      stack << e
    end
  end
  stack
end

buildings = [3,1,2,6,7,4,5,10,9,8]
buildings.reverse!
puts sunset_buildings(buildings).to_s
