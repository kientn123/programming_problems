def is_protected(r, k)
  radius = Math.sqrt(r).round
  count = 0
  radius.downto(0) do |i|
    count += 1 if is_square(r - i**2)
  end
  #puts 'count: ' + count.to_s
  if is_square(r)
    count = count * 4 - 4
  else
    count = count * 4
  end
  if count - k < 1
    return 'possible'
  else
    'impossible'
  end
end

def is_square(n)
  Math.sqrt(n).round ** 2 == n
end

File.open(ARGV[0], 'r') do |f|
  t = f.gets.to_i
  t.times do
    r, k = f.gets.split.map {|x| x.to_i}
    puts is_protected(r, k)
  end
end