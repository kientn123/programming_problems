=begin
Compute the view from above
Implement a function that computes the view from above. Your input is a sequence of n line segments,
each specified as a 4-tuple (l,r,c,h), where l and r are left and right endpoints, respectively, c
encodes the color, and h are the height. The output should be in the same format. No two segments
whose intervals overlap have the same heights.
=end
class Segment
  attr_accessor(:first, :last, :height)
  def initialize(first, last, height, color)
    @first = Point(first, height, true, color)
    @last = Point(last, height, false, color)
    @first.segment = self
    @last.segment = self
  end

  def <=>(other)
    return @height <=> other.height
  end
end

class Point
  attr_accessor(:x, :height, :is_first, :color, :segment)
  def initialize(x, height, is_first, color)
    @x = x
    @height = height
    @is_first = is_first
    @color = color
    @segment = nil
  end

  def <=>(other)
    if @x != other.x
      return @x <=> other.x
    else
      if @is_first && !other.is_first
        return -1
      elsif !@is_first && other.is_first
        return 1
      else
        return other.height <=> @height
      end
    end
  end
end

def compute_view(seq)
  arr = Array.new
  seq.each do |seg|
    arr << seg.first
    arr << seg.lass
  end

  arr.sort!
  res = Array.new
  bst = Array.new
  prev = arr[0]
  1.upto(arr.length-1) do |i|
    if arr[i].is_first
      bst << arr[i].segment
      if arr[i].segment == bst.max
        res << Point(prev.x, arr[i].x, arr[i].height, arr[i].color)
        prev = arr[i]
      end
    else arr[i].is_first
      if arr[i].segment == bst.max
        res << Point(prev.x, arr[i].x, arr[i].height, arr[i].color)
        prev = arr[i]
      end
      
      bst.delete(arr[i].segment)
    end
  end
end
