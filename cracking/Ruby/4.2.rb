=begin
 Given a directed graph, design an algrorithm to find out whether there is a route between two nodes
 Idea: breadth-first-search and depth-first-search implementation
=end

directed_graph = {
  one: [:two, :four, :five],
  two: [],
  three: [:two, :four, :five],
  four: [:two, :five],
  five: []
}

class GraphBreadthFirstManager
  def initialize graph 
    @graph = graph
  end
  
  def is_connected first, second
    # always do the nil checking first
    if @graph[first].nil? || @graph[second].nil?
      return false
    end
    queue = @graph[first]
    is_checked = {}
    while queue.length != 0
      current = queue.shift
      if current == second 
        return true
      else
        is_checked[current] = true
        queue + @graph[second].select do |x| is_checked[x].nil? end
      end
    end
    return false
  end
  
  def has_route first, second
    (is_connected first, second) || (is_connected second, first)
  end
end

class GraphDepthFirstManager
  def initialize graph
    @graph = graph
  end
  
  def is_connected first, second, is_checked
    @graph[first].each do |element|
      if element == second 
        return true
      else
        if is_checked[element].nil?
          is_checked[element] = true
          is_connected element, second, is_checked
        end
      end
    end
    false
  end
  
  def has_route first, second
    (is_connected first, second, {}) || (is_connected second, first, {})
  end
end

manager = GraphDepthFirstManager.new directed_graph
puts manager.has_route :one, :three
