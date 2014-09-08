=begin
Decide if two strings are anagrams or not
=end

def anagram(str1, str2)
  return false if str1.length != str2.length
  arr1 = Array.new(26, 0)
  arr2 = Array.new(26, 0)
  str1.downcase!; str2.downcase!
  str1.each_char do |char|
    arr1[char.ord - 'a'.ord] += 1
  end
  str2.each_char do |char|
    arr2[char.ord - 'a'.ord] += 1
  end
  (0..arr1.length - 1).each do |i|
    return false if arr1[i] != arr2[i]
  end
  true
end

a = "hello"; b = "elolh"
c = "ohlau"; d = "lhaue"
puts anagram(a, b)
puts anagram(c, d)
