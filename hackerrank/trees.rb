class Trees
  def bst?(node)

  end

  def inorder_traversal(root)
    s = [] # Stack
    current = root

    while !s.empty? || current != nil
      if current
        s.push(current)
        current = current.left
      else
        current = s.pop
        puts current.value
        current = current.right
      end
    end
  end

  def preorder_traversal(root)
    s = []
    current = root
    while !s.empty? || current != nil
      current = s.pop
      puts current.value
      if current.right != nil
        s.push(current.right)
      end
      if current.left != nil
        s.push(current.left)
      end
    end
  end
end
