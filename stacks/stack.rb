require_relative '../lists/linked_list'
class Stack
  attr_reader :stack
  attr_accessor :top
  def initialize()
    @stack = LinkedList.new()
  end

  def push(value)
    @stack.insert_front(value)
    true
  end

  def pop
    raise 'UnderflowError' unless @stack.head
    @stack.delete_at(0)
  end

  def peek
    raise 'EmptyStackError' unless @stack.head
    @stack.head.data
  end

  def empty?
    @stack.head == nil
  end

  def inspect
    @stack.inspect
  end
  # p 110
end
