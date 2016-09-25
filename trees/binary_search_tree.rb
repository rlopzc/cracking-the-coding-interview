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

    def include?(data)
      case value <=> data
      when 1 then left_node.include?(data)
      when -1 then right_node.include?(data)
      when 0 then true
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
  end
end
