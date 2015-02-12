=begin
Compute the average of the top three scores
Write a function which takes as input the name of the file containing n test scores and output the
students who has maximum average score across his or her top three tests. If the student has fewer
than three test scores, discard that student. Return no such student if no student has three or
more test scores
=end
def highest_average(arr)
  return if arr.length == 0
  hash = Hash.new()

  # Should have used multiset or maxheap to be values in the hash, but we'll use list instead
  # since ruby standard library doesn't have implementations for maxheap or multiset
  arr.each do |ele|
    if hash[ele[0]].nil?
      hash[ele[0]] = Array.new
    end

    if hash[ele[0]].length == 3
      if hash[ele[0]].min < ele[1]
        hash[ele[0]].delete(hash[ele[0]].min)
        hash[ele[0]] << ele[1]
      end
    else
      hash[ele[0]] << ele[1]
    end
  end

  puts hash.to_s
  res = {name: nil, average: 0}
  hash.each do |key, value|
    average = value.inject(0) {|sum, e| sum+e} / 3.0
    if average > res[:average]
      res[:name] = key
      res[:average] = average
    end
  end

  return res
end

arr = [["a",3],["b", 4],["c",5],["a",10],["a",10],["b",9],["c",8],["b",2],["c",5],
       ["b",10],["b",10]]
puts highest_average(arr)
