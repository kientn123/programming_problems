=begin
Design an algorithm for computing the LCA in a binary tree of a and b with parent pointers in
O(max(da-dl, db-dl)). What is the worst case time and space complexity of your algorithm
=end
def lca(a, b)
  hash = Hash.new
  runner_a = a; runner_b = b
  while true
    if runner_a || runner_b
      if runner_a
      	puts "runner_a: #{runner_a.name}"
        if hash[runner_a]
          return runner_a
        end
        hash[runner_a] = true
        runner_a = runner_a.parent
      end
    	if runner_b
    		puts "runner_b: #{runner_b.name}"
      	if hash[runner_b]
        	return runner_b
      	end
      	hash[runner_b] = true
      	runner_b = runner_b.parent
      end
    else
    	break
    end
	end
end

class Node
	attr_accessor(:parent, :left, :right, :data, :name)
	def initialize(data, name)
		@data = data
		@left = nil
		@right = nil
		@parent = nil
		@name = name
	end
	
	def hash
		@name.hash
	end
	
	def eql?(other)
		return @name == other.name
	end    
end

a = Node.new(314,"a"); b = Node.new(6,"b"); c = Node.new(271,"c")
d = Node.new(28,"d"); e = Node.new(0,"e"); f = Node.new(561,"f")
g = Node.new(3,"g"); h = Node.new(17,"h"); i = Node.new(6,"i")
j = Node.new(2,"j"); k = Node.new(1,"k"); l = Node.new(401,"l")
m = Node.new(641,"m"); n = Node.new(257,"n"); o = Node.new(271,"o"); p = Node.new(28,"p")

a.left = b; a.right = i; b.left = c; b.right = f; c.left = d; c.right = e
f.right = g; g.left = h; i.left = j; j.right = k; k.left = l; k.right = n
l.right = m; i.right = o; o.right = p

b.parent = a; i.parent = a; c.parent = b; f.parent = b; j.parent = i
o.parent = i; d.parent = c; e.parent = c; g.parent = f; h.parent = g
k.parent = j; l.parent = k; n.parent = k; m.parent = l; p.parent = o

puts lca(l, p).name
# hash = Hash.new
# hash[a] = 1
# a1 = Node.new(2,"a")
# puts a1.name
# puts a.name
# puts hash[a]
# puts hash[a1]