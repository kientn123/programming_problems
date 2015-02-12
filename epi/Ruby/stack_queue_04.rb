=begin
Compute the longest substring with matching parens
Write a function that takes as input a string s made up of the characters "("
and ")", and returns a maximum length substring of s in which the parens are
matched.
=end

def longest_substr(str)
  stack = []
  start = 0
  max = -1
  0.upto(str.length-1) do |i|
    if str[i] == "("
      stack << i
    else # meet ")"
      if stack.empty?
        start = i
      else
        stack.pop
        first = stack.empty? ? start : stack[-1]
        max = [max, i - first].max
      end
    end
  end
  max
end

str = "((())()(()("
puts longest_substr(str)
