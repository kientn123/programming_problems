=begin
Compute the smallest non-constructible change
Write a function which takes an array A of positive integers and returns the smallest k
such that k is not equal to the sum of a subset of elements of A
=end
def nonconstructible_change(arr)
  arr.sort!
  sum = 0
  arr.each do |change|
    if change > sum + 1
      break
    else
      sum += change
    end
  end

  return sum+1
end

arr = [1,1,5,10]
puts nonconstructible_change(arr)
