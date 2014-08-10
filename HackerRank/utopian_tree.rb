=begin
  https://www.hackerrank.com/challenges/utopian-tree
=end
def utopian_tree(n)
    if n==0
        return 1
    else
        if n%2 == 0
            return utopian_tree(n-1) + 1
        else
            return utopian_tree(n-1) * 2
        end
    end
end

num_cases = gets.to_i
(1..num_cases).each do
    n = gets.to_i
    puts utopian_tree(n)
end
