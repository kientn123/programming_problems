=begin
Enumerate strings of balanced parens
=end
def enumerate(k)
  res = Array.new
  ans = Array.new
  helper(k, 0, 0, ans, res)
  res
end

def helper(k, num_left, num_right, ans, res)
  if num_left == k && num_right == k
    res << ans.join("")
    return
  end
  if num_left == k
    ans << ")"
    helper(k, num_left, num_right+1, ans, res)
    ans.pop
  elsif num_left == num_right
    ans << "("
    helper(k, num_left+1, num_right, ans, res)
    ans.pop
  else
    ans << "("
    helper(k, num_left+1, num_right, ans, res)
    ans.pop
    ans << ")"
    helper(k, num_left, num_right+1, ans, res)
    ans.pop
  end
end

puts enumerate(3).to_s
