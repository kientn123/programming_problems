=begin
Reverse digits
Write a function which takes an integer K and returns the integer corresponding to the digits of K
written in reverse order
=end
def reverse_num(k)
  negative = false
  if k < 0
    negative = true
    k = -k
  end

  res = 0
  while k > 0
    res = res * 10 + k % 10
    k = k/10
  end

  return negative ? -res : res
end

puts reverse_num(-314)
puts reverse_num(281729)
