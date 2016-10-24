module BinarySearchTree
  class Node
    attr_reader :data
    attr_accessor :left, :right

    def initialize(data)
      @data = data
      @left = EmptyNode.new
      @right = EmptyNode.new
    end

    def insert(data)
      case data <=> data
      when 1 then insert_left(data)
      when -1 then insert_right(data)
      when 0 then false
      end
    end

    def inspect
      "{#{data}::#{left.inspect}|#{right.inspect}}"
    end

    def empty_node
      false
    end

    def include?(data)
      case data <=> data
      when 1 then left.include?(data)
      when -1 then right.include?(data)
      when 0 then true
      end
    end

    def self.in_order_traversal(node)
      if node != nil
        left = in_order_traversal(node.left)
        if left != nil && left.data != nil
          return false if left.data >= node.data
        end
        right = in_order_traversal(node.right)
        if right != nil && right.data != nil
          return false if right.data <= node.data
        end
        node
      end
    end

    def self.in_order_traversal_iterative(node)
      # s = Array.new--
      # TODO implementar iterativo

    end

    def self.pre_order_traversal(node)
      if node != nil
        puts node.data if !node.empty_node
        in_order_traversal(node.left)
        in_order_traversal(node.right)
      end
    end

    def self.post_order_traversal(node)
      if node != nil
        in_order_traversal(node.left)
        in_order_traversal(node.right)
        puts node.data if !node.empty_node
      end
    end

    private
    def insert_left(data)
      left.insert(data) or self.left = Node.new(data)
    end

    def insert_right(data)
      right.insert(data) or self.right = Node.new(data)
    end
  end

  class EmptyNode
    def insert(*)
      false
    end
    def include?(*)
      false
    end
    def inspect
      "{}"
    end
    def left
      nil
    end
    def right
      nil
    end
    def empty_node
      true
    end
    def data
      nil
    end
  end
end
