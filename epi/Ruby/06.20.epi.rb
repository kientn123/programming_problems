=begin
Generate non-uniform random numbers
You are given a set T of n distinct real numbers [t0,t1,..,tn-1] and
probabilities [p0,p1,..,pn-1], which sum up to 1. Assume that t0<t1<..<tn-1.
Given a random number generator that produces values in [0,1] uniformly, how
would you generate a number in T according to the specified probabilities?
=end
def generate(t, p)
  probabilities = Array.new(p.length, 0)
  puts probabilities.to_s
  1.upto(p.length-1) do |i|
    probabilities[i] = probabilities[i-1] + p[i-1]
  end
  puts probabilities.to_s
  ran = rand()
  index = binary_search(probabilities, ran)
  return t[index]
end

def binary_search(arr, ran)
  left = 0
  right = arr.length - 1
  while left <= right
    mid = (left + right) / 2
    if arr[mid] == ran
      return mid
    elsif arr[mid] > ran
      right = mid - 1
    else
      left = mid + 1
    end
  end
  return right
end

p = [0.1,0.2,0.3,0.4]
t = [1,2,3,4]
puts generate(t, p)
