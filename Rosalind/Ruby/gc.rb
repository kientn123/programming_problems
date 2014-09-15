=begin
Computing GC Content
http://rosalind.info/problems/gc/
=end

def gc_content(s)
  count = s.count('gc')
  count * 1.0 / s.length * 100
end

File.open(ARGV[0], 'r') do |f|
  count = 0
  f.each do |line|
    count += 1
  end
  puts count
  # max = ''
  # max_count = 0
  # until true
  #   name = f.gets.strip
  #   s = f.gets.strip
  #   count = gc_content(s)
  #   if count > max_count
  #     max_count = count
  #     max = name
  #   end
  # end
  # puts name
  # puts max_count
end
