=begin
https://www.hackerrank.com/challenges/is-fibo
=end

def is_fib(n)
  a = 0; b = 1
  until b >= n
    a, b = b, a + b
  end
  b == n ? true : false
end

t = gets.to_i
t.times do
  puts is_fib(gets.to_i) ? "IsFibo" : "IsNotFibo"
end
