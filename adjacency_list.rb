class AdjacencyList
  class Vertex
    attr_reader :value, :neighboors
    def initialize(value)
      @value = value
      @neighboors = []
    end

    def add_neightboor(vertex)
      self.neighboors << vertex
    end

    def inspect
      "Vertext: #{value} Edges: #{neighboors.each {|n| print "#{n.value} | "}}"
    end
  end

  attr_reader :vertices
  def initialize()
    @vertices = {}
  end

  def add_vertex(vertex)
    self.vertices[vertex.value] = vertex
  end

  def add_neightboor(vertex, neighboor)
    vertices[vertex.value].add_neightboor(neighboor)
  end

  def inspect
    vertices.each do |key, value|
      puts "#{value.inspect}"
    end
    true
  end

  def include?(vertex)
    vertices.include? vertex
  end
end
