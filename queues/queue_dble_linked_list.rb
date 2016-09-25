require_relative '../lists/double_linked_list'
class QueueDbleLinkedList
  attr_reader :queue
  def initialize
    @queue = DoubleLinkedList.new
  end

  def enqueue(elem)
    queue.add(elem)
    true
  end

  def dequeue
    queue.delete_first
  end
  #code
end
