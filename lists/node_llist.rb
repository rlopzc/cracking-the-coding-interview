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

  def self.compare_two_llists(head_a, head_b)
    return false if head_a == nil || head_b == nil
    while head_a != nil && head_b != nil && head_a.data == head_b.data
      head_a, head_b = head_a.next, head_b.next
    end
    head_a == head_b
  end

  def self.compare_two_llists_recursive(head_1, head_2)
    if head_1 != nil && head_2 != nil
      return (head_1.data == head_2.data) && compare_two_llists_recursive(head_1.next, head_2.next)
    elsif head_1 == nil && head_2 == nil
      return true
    elsif head_1 != nil || head_2 != nil
      return false
    end
  end

  def self.merge_llists(head_a, head_b)
    return head_a if head_b == nil
    return head_b if head_a == nil

    new_list = nil
    while head_a != nil && head_b != nil
      if head_a.data <= head_b.data
        new_list = Node.append_to_tail(new_list, head_a.data)
        head_a = head_a.next
      else
        new_list = Node.append_to_tail(new_list, head_b.data)
        head_b = head_b.next
      end
    end

    while head_a != nil
      new_list = Node.append_to_tail(new_list, head_a.data)
      head_a = head_a.next
    end
    while head_b != nil
      new_list = Node.append_to_tail(new_list, head_b.data)
      head_b = head_b.next
    end
    new_list
  end

  def self.merge_llists_recursive(head_a, head_b)
    # TODO to implement
  end

  def self.position_from_tail(head, position)
    slow = fast = head
    (position + 1).times do
      fast = fast.next
    end
    while fast != nil
      fast = fast.next
      slow = slow.next
    end
    puts slow.data
  end

  def self.position_from_tail_stack(head, position)
    s = [] # Stack
    while head != nil
      s.push(head.data)
      head = head.next
    end
    s[-(position + 1)]
  end

  def self.position_from_tail_recursive(head, position)
    if head == nil
      return position
    end
    current_pos = position_from_tail_recursive(head.next, position)
    if current_pos == 0
      puts head.data
      nil
    elsif current_pos != nil && current_pos > 0
      current_pos - 1
    end
  end

  def self.delete_duplicate_values(head)
    tmp = head
    while tmp != nil
      if tmp.next != nil && tmp.next.data == tmp.data
        tmp.next = tmp.next.next
      else
        tmp = tmp.next
      end
    end
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
