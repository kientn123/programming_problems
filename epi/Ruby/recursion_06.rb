=begin
Enumerate all subsets of size k
=end
def enumerate_subsets(n, k)
  res = Array.new
  ans = Array.new
  helper(n, k, 1, ans, res)
  res
end

def helper(n, k, start, ans, res)
  if ans.length == k
    res << ans[0..ans.length-1]
    return
  end
  if k - ans.length <= n - start
    helper(n, k, start+1, ans, res)
  end
  ans << start
  helper(n, k, start+1, ans, res)
  ans.pop
end

puts enumerate_subsets(5, 3).to_s
