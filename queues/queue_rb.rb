class QueueRb
  def initialize
    @queue = []
  end

  def queue(elem)
    @queue << elem
  end

  def dequeue
    @queue.shift
  end
  #code
end
