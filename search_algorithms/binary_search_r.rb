class BinarySearchR

  def search(ary, value, from = 0, to = nil)
    if to == nil
      to = ary.count - 1
    end
    return if from > to || to < from
    middle = (from + to) / 2
    case value <=> ary[middle]
    when 0
      # Mach
      return middle
    when 1
      # Valor es mayor que middle
      search(ary, value, middle + 1, to)
    when -1
      # Valor es menor que middle
      search(ary, value, from, middle - 1)
    end
  end
  #code
end
