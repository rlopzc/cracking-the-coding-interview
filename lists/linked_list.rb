class LinkedList
  class Node
    attr_accessor :next, :data

    def initialize(data)
      @data = data
      @next = nil
    end
  end

  attr_accessor :head
  def initialize
    @head = nil
  end

  def print_list
    current = @head
    while current != nil
      print "#{current.data} -> "
      current = current.next
    end
    puts "END"
  end

  def insert_at_end(data)
    current = @head
    new_node = Node.new(data)
    if @head == nil
      @head = new_node
      return true
    end

    while current.next != nil
      current = current.next
    end
    current.next = new_node
  end

  def insert_front(data)
    current = @head
    @head = Node.new(data)
    @head.next = current
  end

  def insert_after(prev_node, data)
    return nil unless prev_node

    new_node = Node.new(data)
    new_node.next = prev_node.next
    prev_node.next = new_node
  end

  def print_inverted(current)
    return unless current
    print_inverted(current.next)
    print "#{current.data} -> "
  end

  def delete_node(data)
    current = @head
    if current.data == data
      #Head es el nodo a eliminar
      @head = current.next
    else
      prev = nil
      while current != nil && current.data != data
        prev = current
        current = current.next
      end

      # No se encontró el valor
      return nil unless current
      prev.next = current.next
    end
  end

  def delete_at(position)
    current = @head
    if position == 0
      @head = current.next
      return true
    end

    (position-1).times do
      return nil unless current
      current = current.next
    end
    # while current != nil && index != position
    #   prev = current
    #   current = current.next
    #   index += 1
    # end
    next_node = current.next.next
    current.next = next_node
    true
  end

  def search_recursive(current, data)
    return nil unless current
    return true if current.data == data
    search_recursive(current.next, data)
  end
end
