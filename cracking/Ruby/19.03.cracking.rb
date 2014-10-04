=begin
Computes the number of trailing 0's in n factorial
=end

def num_zeros_in_factorial_of(n)
	count = 0
	runner = 5
	until runner > n
		count += n / runner
		runner *= 5
	end
	count
end

puts num_zeros_in_factorial_of(10)