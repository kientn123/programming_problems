=begin
Compute the closest entries in three sorted arrays
=end

include Java
import java.util.TreeSet

def closest(arrs)
  index = Array.new(arrs.length, 0)
  puts index.to_s
  tree = TreeSet.new(Comp.new)
  min = Float::INFINITY
  puts min
  0.upto(arrs.length-1) do |i|
    if index[i] >= arrs[i].length
      return min
    end
    tree.add(ArrData.new(arrs[i][index[i]], i))
  end
  puts tree.to_s
  loop do
    min = [min, tree.last.data - tree.first.data].min
    tar = tree.first.arr
    index[tar] += 1
    if index[tar] >= arrs[tar].length
      return min
    end
    tree.pollFirst
    tree.add(ArrData.new(arrs[tar][index[tar]], tar))
    puts tree.to_s
  end
end

class ArrData
  attr_accessor(:data, :arr)
  def initialize(data, arr)
    @data = data
    @arr = arr
  end

  def to_s
    @arr.to_s + ": " + @data.to_s
  end
end

class Comp
  def compare(this, that)
    this.data <=> that.data
  end
end
arrs = [[1,5,6,10],
        [7,12,13,18],
        [2,8,13,15]]
puts closest(arrs)
