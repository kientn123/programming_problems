=begin
https://www.hackerrank.com/contests/infinitum-aug14/challenges/reverse-game
=end
def reverse_game(n, k)
  if (n - 1) % 2 == 0
    if k == (n - 1)/2
      return n - 1
    elsif k < (n - 1)/2
      return 2 * k + 1
    else
      return 2 * (n - k)
    end
  else
    if k <= (n - 1)/2
      return 2 * k + 1
    else
      return 2 * (n - k)
    end
  end
end

t = gets.to_i
t.times do
  n, k = gets.split.map {|x| x.to_i}
  puts reverse_game(n, k)
end
