=begin
Check if rectangles intersect
Let R and S be XY-aligned rectangles. Write a function which tests if R and S have a nonempty
intersection. If the intersection is nonempty, return the rectangle formed by their intersection
=end
def is_intersect(r, s)
  return s.x + s.width >= r.x && r.x + r.width >= s.x \
    && s.y + s.height >= r.y && r.y + r.height >= s.y
end

def intersection(r, s)
  res = Rectangle.new
  if is_intersect(r, s)
    res.x = [r.x, s.x].max
    res.y = [r.y, s.y].max
    res.width = r.x > s.x ? [s.x+s.width-r.x, r.width].min : [r.x+r.width-s.x, s.width].min
    res.height = r.y > s.y ? [s.y+s.height-r.y, r.height].min : [r.y+r.height-s.y, s.height].min
  end
  return res
end

class Rectangle
  attr_accessor(:x, :y, :width, :height)
  def initialize()
    @x = nil; @y = nil
    @width = nil; @height = nil
  end

  def to_s
    return {x: @x, y: @y, width: @width, height: @height}.to_s
  end
end

r = Rectangle.new; r.x = 1; r.y = 2; r.width = 5; r.height = 5
s = Rectangle.new; s.x = 2; s.y = 1; s.width = 5; s.height = 5
puts intersection(r, s)
