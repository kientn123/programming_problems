=begin
The towers of Hanoi problem
Exactly n rings on P1 need to be transferred to P2, possibly using P3 as an
intermediate, subject to the stacking constraint.
=end
def towers_of_Hanoi(stacks)
  transfer(stacks[0].length, stacks, 0, 1, 2)
end

def transfer(n, stacks, from, to, use)
  return if n == 0
  transfer(n-1, stacks, from, use, to)
  stacks[to] << stacks[from].pop
  puts "move " + stacks[to][-1].to_s + " from " + from.to_s + " to " + to.to_s
  transfer(n-1, stacks, use, to, from)
end

stacks = [[3,2,1], [], []]
towers_of_Hanoi(stacks)
