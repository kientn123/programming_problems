=begin
Counting Point Mutations
=end

def hamm(s1, s2)
  count = 0
  0.upto(s1.length - 1) do |i|
    count += 1 if s1[i] != s2[i]
  end
  count
end

#puts hamm('GAGCCTACTAACGGGAT', 'CATCGTAATGACGGCCT')
File.open(ARGV[0], 'r') do |f|
  puts f.length()
end
