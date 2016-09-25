require_relative 'lists/linked_list'
class Stack
  attr_reader :stack
  def initialize()
    @stack = LinkedList.new()
  end

  def push(value)
    @stack.add(value)
  end

  def pop
    @stack.delete_last
  end
  #code
end
