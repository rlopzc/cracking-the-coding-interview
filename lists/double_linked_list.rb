class DoubleLinkedList
  class Node
    attr_accessor :prev, :data, :next
    def initialize(data)
      @prev = @next = nil
      @data = data
    end
  end

  def initialize
    @head = nil
  end

  def add(data)
    new_node = Node.new(data)
    if !@head
      @head = new_node
    else
      current = @head
      while current.next != nil do
        current = current.next
      end
      current.next = new_node
      new_node.prev = current
    end
  end

  def insert(index, data)
    new_node = Node.new(data)
    current = @head
    if index == 0
      new_node.next = current
      current.prev = new_node
      @head = new_node
    else
      index.times do
        current = current.next
      end
      tmp = current.next
      current.next = new_node
      new_node.prev = current
      new_node.next = tmp
    end
  end

  def delete_first
    current = @head
    if current&.next
      @head = current.next
      @head.prev = nil
      current.data
    else
      return false
    end
  end

  def inspect
    current = @head
    while current != nil
      str = current.prev ? current.prev.data.to_s : 'nil'
      str += " <= #{current.data.to_s} => "
      str += current.next ? current.next.data.to_s : "nil"
      puts str
      current = current.next
    end
  end

  def reverse
    current = @head
    tmp = nil
    while current != nil
      tmp = current.prev
      current.prev = current.next
      current.next = tmp
      current = current.prev
    end
    @head = tmp.prev
  end
end
