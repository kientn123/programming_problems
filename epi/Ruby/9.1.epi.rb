=begin
Design a stack that support max operation
=end

class MaxStack
  attr_accessor(:max_arr)
  def initialize()
    @arr = Array.new
    @max_arr = Array.new
  end

  def push(num)
    @arr << num
    if @arr.length == 1
      @max_arr << [num, 1]
    else
      if num > @max_arr[@max_arr.length - 1][0]
        @max_arr << [num, 1]
      else
        @max_arr[@max_arr.length - 1][1] += 1
      end
    end
  end

  def pop
    result = @arr.pop
    if @max_arr.length > 0
      @max_arr[@max_arr.length - 1][1] -= 1
      if @max_arr[@max_arr.length - 1][1] == 0
        @max_arr.pop
      end
    end
  end

  def max
    @max_arr[@max_arr.length - 1][0]
  end
end

stack = MaxStack.new
stack.push(4)
puts stack.max
stack.push(6)
puts stack.max
stack.push(5)
puts stack.max
stack.push(3)
puts stack.max
stack.push(8)
puts stack.max
stack.push(7)
puts stack.max
stack.pop
puts stack.max
stack.pop
puts stack.max
stack.pop
stack.pop
stack.pop
puts stack.max
