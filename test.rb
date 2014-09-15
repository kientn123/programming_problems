File.open(ARGV[0], 'r') do |f|
  puts f.gets
  puts f.gets.class
end
