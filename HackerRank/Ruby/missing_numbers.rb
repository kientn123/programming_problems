=begin
https://www.hackerrank.com/challenges/missing-numbers
=end

def missing_numbers(arra, arrb)
  hashb = Hash.new(0)
  hasha = Hash.new(0)

  arra.each do |x|
    hasha[x] += 1
  end

  arrb.each do |x|
    hashb[x] += 1
  end
  answer = Array.new
  hashb.each do |k, v|
    answer << k if hasha[k] < v
  end
  answer
end

File.open(ARGV[0]) do |f|
  f.gets
  arra = f.gets.strip.split.map {|x| x.to_i}
  f.gets
  arrb = f.gets.strip.split.map {|x| x.to_i}
  answer = missing_numbers(arra, arrb)
  puts answer.join(" ")
end
