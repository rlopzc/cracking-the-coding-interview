class LinkedList
  class Node
    attr_accessor :next, :data

    def initialize(data)
      @data = data
      @next = nil
    end
  end

  attr_accessor :head
  def initialize
    @head = nil
  end

  def inspect
    current = @head
    while current != nil
      print "#{current.data} -> "
      current = current.next
    end
    puts "END"
  end

  def insert_at_end(data)
    current = @head
    new_node = Node.new(data)
    if @head == nil
      @head = new_node
      return true
    end

    while current.next != nil
      current = current.next
    end
    current.next = new_node
  end

  def insert_front(data)
    current = @head
    @head = Node.new(data)
    @head.next = current
  end

  def insert_after(prev_node, data)
    return nil unless prev_node

    new_node = Node.new(data)
    new_node.next = prev_node.next
    prev_node.next = new_node
  end

  def print_inverted(current)
    return unless current
    print_inverted(current.next)
    print "#{current.data} -> "
  end

  def delete_node(data)
    current = @head
    if current.data == data
      #Head es el nodo a eliminar
      @head = current.next
    else
      prev = nil
      while current != nil && current.data != data
        prev = current
        current = current.next
      end

      # No se encontró el valor
      return nil unless current
      prev.next = current.next
    end
  end

  def delete_at(position)
    current = @head
    if position == 0
      @head = current.next
      return true
    end

    (position-1).times do
      return nil unless current
      current = current.next
    end
    # while current != nil && index != position
    #   prev = current
    #   current = current.next
    #   index += 1
    # end
    next_node = current.next.next
    current.next = next_node
    true
  end

  def insert_sorted(data)
    new_node = Node.new(data)
    unless @head
      @head = new_node
      return true
    end

    tmp = @head
    if data <= tmp.data
      new_node.next = tmp
      @head = new_node
    else
      #Traverse the list
      prev = nil
      while tmp != nil && tmp.data <= data
        prev = tmp
        tmp = tmp.next
      end
      prev.next = new_node
      new_node.next = tmp
    end
    true
  end

  def delete_node(start_node, node_to_delete)
    return nil if start_node == @head
    tmp = start_node
    while tmp != nil && tmp.next != node_to_delete
      tmp = tmp.next
    end
    return nil unless tmp
    tmp.next = tmp.next.next
    true
  end

  def search_recursive(current, data)
    return nil unless current
    return true if current.data == data
    search_recursive(current.next, data)
  end

  def self.compare_strings(llist_1, llist_2)
    string_1 = ""
    string_2 = ""
    # Convertir a string la primera
    tmp = llist_1.head
    while tmp != nil
      string_1 += tmp.data
      tmp = tmp.next
    end
    # Covertir a string la segunda
    tmp = llist_2.head
    while tmp != nil
      string_2 += tmp.data
      tmp = tmp.next
    end

    case string_1 <=> string_2
    when 0
      0
    when 1
      1
    when -1
      -1
    end
  end

  def self.compare_strings_2(llist_1, llist_2)
    tmp_1 = llist_1.head
    tmp_2 = llist_2.head

    while tmp_1 != nil && tmp_2 != nil && tmp_1.data == tmp_2.data
      tmp_1 = tmp_1.next
      tmp_2 = tmp_2.next
    end

    # Si son del mismo tamanio pero de diferente caracter
    if tmp_1 != nil && tmp_2 != nil
      return (tmp_1.data > tmp_2.data ? 1 : -1)
    end
    if tmp_1 != nil && tmp_2 == nil
      return 1
    end
    if tmp_1 == nil && tmp_2 != nil
      return -1
    end
    0
  end

  def self.add_two_numbers(llist_1, llist_2)
    #Convert lists to numbers
    num_1 = 0
    tmp_1 = llist_1.head
    while tmp_1 != nil
      num_1 = (num_1 * 10) + tmp_1.data
      tmp_1 = tmp_1.next
    end

    num_2 = 0
    tmp_2 = llist_2.head
    while tmp_2 != nil
      num_2 = (num_2 * 10) + tmp_2.data
      tmp_2 = tmp_2.next
    end
    result = num_1 + num_2
    r_list = LinkedList.new
    result.to_s.split('').map(&:to_i).each do |digit|
      r_list.insert_at_end(digit)
    end
    r_list
  end

  def size
    n = 0
    tmp = @head
    while tmp != nil
      n += 1
      tmp = tmp.next
    end
    n
  end

  def slice(index, number_of_nodes)
    start = 0
    tmp = @head
    new_list = LinkedList.new
    while tmp != nil && start < (index + number_of_nodes)
      if start >= index
        new_list.insert_at_end(tmp.data)
      end
      start += 1
      tmp = tmp.next
    end
    new_list
  end

  def self.merge_sort(list)
    size = list.size
    return list if size <= 1
    mid = size / 2

    # Divide!!!
    left_part = merge_sort(list.slice(0, mid))
    right_part = merge_sort(list.slice(mid, size - mid))

    # Conquerr!!
    merge(left_part, right_part)
  end

  def self.merge(left_part, right_part)
    sorted_list = LinkedList.new
    tmp1 = left_part.head
    tmp2 = right_part.head

    while tmp1 != nil && tmp2 != nil
      if tmp1.data < tmp2.data
        sorted_list.insert_at_end(tmp1.data)
        tmp1 = tmp1.next
      else
        sorted_list.insert_at_end(tmp2.data)
        tmp2 = tmp2.next
      end
    end

    while tmp1 != nil
      sorted_list.insert_at_end(tmp1.data)
      tmp1 = tmp1.next
    end
    while tmp2 != nil
      sorted_list.insert_at_end(tmp2.data)
      tmp2 = tmp2.next
    end
    sorted_list
  end

  def print_random()
    return nil unless @head
    result = slice(rand(size+1), 1)
    result.head.data
  end

  def remove_duplicates
    memo = {}
    current = @head
    prev = nil
    while current != nil
      if memo.has_key?(current.data)
        prev.next = current.next
      end
      memo[current.data] = true
      prev = current
      current = current.next
    end
    @head
  end

  def return_kth_to_last(start)
    index = 0
    current = @head

    while current != nil
      if index == start
        llist = LinkedList.new
        llist.head = current
        return llist
      end
      current = current.next
      index += 1
    end
  end
end
