=begin
Evaluate RPN expressions
Write a function that takes an arithmetical expression in RPN and returns the
number that the expression evaluates to.
=end

def rpn_evaluate(expr)
  expr_arr = expr.split(",")
  stack = Array.new
  expr_arr.each do |e|
    if e == "+" || e == "-" || e == "x" || e == "/"
      x = stack.pop
      y = stack.pop
      z = 0
      case e
      when "+" then z = x + y
      when "-" then z = x - y
      when "x" then z = x * y
      else
        z = x / y
      end
      stack << z
    else
      stack << e.to_i
    end
  end
  stack.pop
end

expr = "3,4,x,1,2,+,+"
expr2 = "1,1,+,-2,x"
puts rpn_evaluate(expr)
puts rpn_evaluate(expr2)
