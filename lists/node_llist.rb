class Node
  attr_accessor :next, :data
  def initialize(data)
    @data = data
  end

  def self.print_llist(head)
    return if head == nil
    tmp = head
    while tmp != nil
      puts tmp.data
      tmp = tmp.next
    end
  end

  def self.print_llist_recursive(node)
    return if node == nil
    puts node.data
    print_llist_recursive(node.next)
    return node
  end

  def self.append_to_tail(head, data)
    return Node.new(data) if head == nil
    tmp = head
    while tmp.next != nil
      tmp = tmp.next
    end
    tmp.next = Node.new(data)
    head
  end

  def self.append_to_tail_recursive(head, data)
    return Node.new(data) if head == nil
    if head.next == nil
      head.next = Node.new(data)
    else
      append_to_tail_recursive(head.next, data)
    end
    return head
  end

  def self.insert_at_head(head, data)
    new_head = Node.new(data)
    new_head.next = head
    return new_head
  end

  def self.insert_at(head, data, position)
    return insert_at_head(head, data) if position == 0
    current_pos = 1
    tmp = head
    while tmp.next != nil && current_pos < position
      tmp = tmp.next
      current_pos += 1
    end
    new_node = Node.new(data)
    new_node.next = tmp.next
    tmp.next = new_node
    return head
  end

  def self.insert_at_recursive(head, data, position)
    return Node.new(data) if head == nil
    if position == 0
      tmp = Node.new(data)
      tmp.next = head
      return tmp
    end
    head.next = insert_at_recursive(head.next, data, position - 1)
    return head
  end

  def self.delete_at(head, position)
    return head.next if position == 0
    tmp = head
    current_pos = 0
    prev = nil
    while tmp.next != nil && current_pos < position
      prev = tmp
      tmp = tmp.next
      current_pos += 1
    end
    prev.next = tmp.next
    return head
  end

  def self.delete_at_recursive(head, position)
    return head.next if position == 0
    if position == 1
      head.next = head.next.next
      return head
    end
    head.next = delete_at_recursive(head.next, position - 1)
    return head
  end

  def self.print_reverse(head)
    s = [] # Stack
    tmp = head
    while tmp != nil
      s.push(tmp.data)
      tmp = tmp.next
    end
    while !s.empty?
      print "#{s.pop} -> "
    end
    puts "||"
  end

  def self.print_reverse_recursive(head)
    #Call Stack
    return if head == nil
    print_reverse_recursive(head.next)
    print "#{head.data} -> "
  end

  def inspect
    tmp = self
    while tmp != nil
      print "#{tmp.data} -> "
      tmp = tmp.next
    end
    puts "||"
  end
end
