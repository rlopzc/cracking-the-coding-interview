class CircularLinkedList
  class Node
    attr_accessor :data, :next
    def initialize(data)
      @data = data
      @next = nil
    end
  end

  def initialize
    @head = nil
  end

  def add(data)
    new_node = Node.new(data)
    if !@head
      @head = new_node
      @head.next = new_node
    else
      current = @head
      while current.next != @head do
        current = current.next
      end
      current.next = new_node
      new_node.next = @head
    end
  end

  def to_s
    current = @head
    while current.next != @head do
      puts current.data
      current = current.next
    end
    puts current.data
    puts "next -> #{current.next.data.to_s}"
  end
end
