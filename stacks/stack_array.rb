class StackArray
  attr_reader :stack, :max_size
  attr_accessor :top
  def initialize(max_size = 10)
    @stack = []
    @top = 0
    @max_size = max_size
  end

  def push(val)
    if top == max_size
      puts "overflow"
      return false
    end
    self.top += 1
    @stack << val
  end

  def pop()
    if top == 0
      puts "underflow"
      return false
    end
    self.top -= 1
    @stack.pop
  end

  def inspect
    @stack.join(' -> ')
  end
end
