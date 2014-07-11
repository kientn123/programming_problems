=begin
 Imagine a (literal) stack of plates. If the stack gets too high, it might topple. Therefore, in real life, 
 we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure
 SetOfStacks that mimics this. SetOfStacks should be composed of several stacks, and should create a new stack
 once the previous one exceeds capacity. SetOfStacks.push and SetOfStacks.pop should behave identically to a single
 stack (that is, pop should return the same values as it would if there were just a single stack)
 
 Follow up
 Implement a function popAt(index) which performs a pop operation on a specific sub-stack 
=end

class SetOfStacks
  def initialize capacity_of_a_stack
    @capacity_of_a_stack = capacity_of_a_stack
    @set_of_stacks = Array.new
    @last = 0
  end
  
  def push num
    if @set_of_stacks[@last].length = @capacity_of_a_stack
      @last += 1
    end
    @set_of_stacks[@last] << num
  end
  
  def pop
    @set_of_stacks[@last].pop
    @set_of_stacks.pop if @set_of_stacks[@last] == 0
  end
  
end