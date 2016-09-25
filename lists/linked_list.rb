class LinkedList

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

  def add(number)
    new_node = Node.new(number)
    current = @head
    if @head
      while current.next != nil do
        current = current.next
      end
      current.next = new_node
    else
      @head = new_node
    end
    true
  end

  def insert_after(index, number)
    new_node = Node.new(number)
    current = @head
    if index == 0
      new_node.next = current
      @head = new_node
    else
      index.times do
        current = current.next
        break if current.next == nil
      end
      new_node.next = current.next
      current.next = new_node
    end
  end

  def delete_after(index)
    current = @head
    index.times do
      current = current.next
    end
    removed_node = current.next
    current.next = nil
    removed_node
  end

  def delete_last
    current = @head
    unless current
      puts 'underflow stack'
      return false
    end
    if current.next == nil
      @head = nil
      current.data
    else
      while current.next.next != nil do
        current = current.next
      end
      val = current.next.data
      current.next = nil
      val
    end
  end

  def inspect
    current = @head
    while current != nil do
      print "#{current.data} -> "
      current = current.next
    end
    puts
  end
end
