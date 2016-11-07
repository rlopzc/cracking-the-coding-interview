class Trees

  def preorder_recursive(node)
    if node != nil
      puts node.data # Visit node
      preorder_recursive(node.left)
      preorder_recursive(node.right)
    end
  end

  def preorder_iterative(node)
    s = [] # Stack
    s.push(node)
    while !s.empty?
      current = s.pop
      puts current.value # Visit node
      s.push(current.right) if current.right != nil
      s.push(current.left) if current.left != nil
    end
  end

  def inorder_recursive(node)
    if node != nil
      inorder_recursive(node.left)
      puts node.data # Visit node
      inorder_recursive(node.right)
    end
  end

  def inorder_iterative(node)
    s = [] # Stack
    while !s.empty? || node != nil
      if node != nil
        s.push(node)
        node = node.left
      else
        node = s.pop
        puts node.value
        node = node.right
      end
    end
  end

  def postorder_recursive(node)
    if node != nil
      postorder_recursive(node.left)
      postorder_recursive(node.right)
      puts node.data #Visit node
    end
  end

  def postorder_iterative(node)
    s = [] # Stack
    last_node_visited = nil
    while !s.empty || node != nil
      if node != nil
        s.push(node)
        node = node.left
      else
        peek = s.last
        if peek.right != nil && last_node_visited != peek.right
          node = peek.right
        else
          puts peek.data # Visit node
          last_node_visited = s.pop
        end
      end
    end
  end


  def BFS(node)
    queue = []
    current = node
    queue.push(current)
    while !queue.empty?
      node = queue.shift
      puts node.data
      if node.left
        queue.push(node.left)
      end
      if node.right
        queue.push(node.right)
      end
    end
  end
end
