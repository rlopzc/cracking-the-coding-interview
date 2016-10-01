class BFS
  def bredth_first_traversal(starting_node, graph)
    # Graph es el arreglo de pares de la grafica
    # Starting node es donde empezamos a contar
    visited = []
    queue = []
    #code
    visited[starting_node] = true
    queue.push(starting_node)
    graph.each do |edge|
      if !visited[edge]
        visited[edge] = true
        queue.push(edge)
      end
    end
    puts queue
  end

end
