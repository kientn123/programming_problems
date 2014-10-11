=begin
Compute a random subset of length k of [0,1,2,3,..,n-1]
=end
def random_subset(n, k)
  hash = Hash.new
  0.upto(k-1) do |i|
    ran = rand(i..n-i-1)
    if hash[n-i-1] && hash[ran]
      hash[n-i-1], hash[ran] = hash[ran], hash[n-i-1]
    elsif hash[n-i-1]
      hash[ran] = hash[n-i-1]
      hash[n-i-1] = ran
    elsif hash[ran]
      hash[n-i-1] = hash[ran]
      hash[ran] = n-i-1
    else
      hash[n-i-1] = ran
      hash[ran] = n-i-1
    end
  end
  res = Array.new(k)
  0.upto(k-1) do |i|
    res[i] = hash[n-i-1]
  end
  return res
end

puts random_subset(10, 5).to_s
