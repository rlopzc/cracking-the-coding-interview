module LinkedList2
  class Node
    attr_accessor :right, :value
    def initialize(value)
      @value = value
    end

    def add(value)
      if right
        right.add(value)
      else
        self.right = Node.new(value)
      end
    end

    def delete_after(index)
      if index == 0
        tmp = right.right
        self.right = tmp
        true
      else
        return false unless right.right
        right.delete_after(index - 1)
      end
    end

    def delete_last
      if right.right
        right.delete_last
      else
        tmp = right
        self.right = nil
        tmp
      end
    end

    def inspect
      "#{value} -> #{right.inspect}"
    end
  end
end
