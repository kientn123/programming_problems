=begin
Check if decimal is a palindrome
=end
def is_palindrome(num)
  return false if num < 0
  return num == reverse_num(num)
end

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

puts is_palindrome(2147447412)
puts is_palindrome(2147483647)
