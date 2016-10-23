module BinarySearchTree
  class Node
    attr_reader :value
    attr_accessor :left_node, :right_node

    def initialize(data)
      @value = data
      @left_node = EmptyNode.new
      @right_node = EmptyNode.new
    end

    def insert(data)
      case value <=> data
      when 1 then insert_left(data)
      when -1 then insert_right(data)
      when 0 then false
      end
    end

    def inspect
      "{#{value}::#{left_node.inspect}|#{right_node.inspect}}"
    end

    def empty_node
      false
    end

    def include?(data)
      case value <=> data
      when 1 then left_node.include?(data)
      when -1 then right_node.include?(data)
      when 0 then true
      end
    end

    def self.in_order_traversal(node)
      if node != nil
        left_node = in_order_traversal(node.left_node)
        if left_node != nil && left_node.value != nil
          return false if left_node.value >= node.value
        end
        right_node = in_order_traversal(node.right_node)
        if right_node != nil && right_node.value != nil
          return false if right_node.value <= node.value
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
        puts node.value if !node.empty_node
        in_order_traversal(node.left_node)
        in_order_traversal(node.right_node)
      end
    end

    def self.post_order_traversal(node)
      if node != nil
        in_order_traversal(node.left_node)
        in_order_traversal(node.right_node)
        puts node.value if !node.empty_node
      end
    end

    private
    def insert_left(data)
      left_node.insert(data) or self.left_node = Node.new(data)
    end

    def insert_right(data)
      right_node.insert(data) or self.right_node = Node.new(data)
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
    def left_node
      nil
    end
    def right_node
      nil
    end
    def empty_node
      true
    end
    def value
      nil
    end
  end
end
