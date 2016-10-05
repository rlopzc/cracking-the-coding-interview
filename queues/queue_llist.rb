require_relative '../lists/linked_list'
class Queue
  attr_reader :queue

  def initialize
    @queue = LinkedList.new
  end

  def add(item)
    @queue.insert_at_end(item)
    true
  end

  def remove
    raise 'QueueEmpty' unless @queue.head
    @queue.delete_at(0)
  end

  def peek
    raise 'NoSuchElementException' unless @queue.head
    @queue.head.data
  end

  def empty?
    @queue.head == nil
  end
end
