=begin
Compute a salary threshold
Let A be an array of n nonnegative real numbers and S be a nonnegative real number less than
sum(A). Design an efficient algorithm for computing lambda such that:
Sigma(min(A[i], lambda)) = S, if such lambda exists
=end
def find_lambda(arr, s)
  return if arr.length == 0
  arr.sort!
  sum = 0
  0.upto(arr.length-1) do |i|
    new_sum = sum + arr[i] * (arr.length - i)
    if new_sum >= s
      return (s - sum) / (arr.length - i)
    else
      sum += arr[i]
    end
  end

  return nil
end

arr = [90,30,100,40,20]
puts find_lambda(arr, 210)
