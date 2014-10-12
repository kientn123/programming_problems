=begin
Sample online data
Design an algorithm that reads packets and continuously maintains a uniform
random subset of size k of the packets after n>k-th packets are read
=end
def sample_online_data(generator, k)
  res = Array.new(k)
  0.upto(k-1) do |i|
    res[i] = generator[i]
  end
  n = k
  while n < generator.length
    index = rand(0..n)
    res[index] = generator[n] if index < k
    n += 1
  end
  res
end

generator = [0,1,2,3,4,5,6,7,8,9]
puts sample_online_data(generator, 5).to_s
