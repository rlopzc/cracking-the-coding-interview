class AdjacencyList
  attr_reader :vertices
  def initialize()
    @vertices = {}
  end

  def add_vertex(data, neighboor)
    if !vertices.has_key?(data)
      self.vertices[data] = [neighboor]
    else
      vertices[data] << neighboor
    end
  end

  def inspect
    vertices.each do |key, value|
      puts "#{key}: #{value.join(', ')}"
    end
    true
  end

  def include?(vertex)
    vertices.has_key? vertex
  end

  def DFS(starting_vertex)
    visited = []
    DFS_helper(starting_vertex, visited)
    true
  end

  def BFS(starting_vertex)
    visited = []
    queue = []
    visited[starting_vertex] = true
    queue.push(starting_vertex)
    while !queue.empty?
      v = queue.shift
      print "#{v} -> "
      vertices[v].each do |edge|
        if !visited[edge]
          visited[edge] = true
          queue.push(edge)
        end
      end
    end
    true
  end

  private
  def DFS_helper(vertex, visited)
    visited[vertex] = true
    print "#{vertex} -> "
    vertices[vertex].each do |edge|
      if !visited[edge]
        DFS_helper(edge, visited)
      end
    end
  end
end
