=begin
Compute the spreadsheet column encoding
Widely deployed spreadsheets use an alphabetical encoding of the successive columns. Specifically,
consecutive columns are identified by A, B, .., Z, AA, AB, ..
=end
def num(s)
  res = 0
  s.each_char do |char|
    res = (res * 26) + (char.ord - "A".ord + 1)
  end

  return res
end

puts num("A")
puts num("AAB")
puts num("AB")
