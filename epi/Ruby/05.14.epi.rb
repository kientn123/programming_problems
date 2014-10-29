=begin
The open doors problem
Five hundreds closed doors along a corridor are numbered 1 to 500. A person walks through the
corridor and opens each door. Another person walks through the corridor and closes every alternate
door. Continuing in this manner, the i-th person comes and toggles the position of every i-th door
starting from door i
Which doors are open after 500-th person has walked through
=end
def is_open(n)
  # Idea: A door is open iff its number has odd number of divisors iff it is a square
  return Math.sqrt(n).floor ** 2 == n
end

puts is_open(5)
puts is_open(9)
