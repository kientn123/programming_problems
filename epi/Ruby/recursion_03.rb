=begin
Enumerate all non-attacking placements of n-Queens
=end

def non_attacking_placement(n)
  placement = Array.new(n, 0)
  res = Array.new
  helper(0, placement, res)
  return res
end

def helper(k, placement, res)
  if k == placement.length
    res << create_output(placement)
  else
    0.upto(placement.length - 1) do |i|
      placement[k] = i
      if is_feasible(placement, k)
        helper(k+1, placement, res)
      end
    end
  end
end

def create_output(placement)
  res = Array.new
  0.upto(placement.length-1) do |i|
    str = "." * placement.length
    str[placement[i]] = "Q"
    res << str
  end
  return res
end

def is_feasible(placement, k)
  0.upto(k-1) do |i|
    diff = (placement[i] - placement[k]).abs
    if diff == 0 || diff == k-i
      return false
    end
  end
  true
end

puts non_attacking_placement(4).to_s
