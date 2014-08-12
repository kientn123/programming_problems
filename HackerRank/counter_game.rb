=begin
https://www.hackerrank.com/contests/w8/challenges/counter-game
=end

T = gets.to_i
T.times do
  players = ["Louise", "Richard"]
  winner = 1
  n = gets.to_i
  while n != 1
    if 2 ** Math.log2(n).to_i == n
      n /= 2
    else
      n -= 2 ** Math.log2(n).to_i
    end
    winner = 1 - winner
  end
  puts players[winner]
end 
