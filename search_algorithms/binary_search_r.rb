class BinarySearchR

  def self.search_recursive(ary, value, from = 0, to = nil)
    if to == nil
      to = ary.count - 1
    end
    return if from > to || to < from
    middle = (from + to) / 2
    case value <=> ary[middle]
    when 0
      # Match return position
      return middle
    when 1
      # Valor es mayor que middle
      search_recursive(ary, value, middle + 1, to)
    when -1
      # Valor es menor que middle
      search_recursive(ary, value, from, middle - 1)
    end
  end
  #code

  def self.search_iterative(ary, value)
    low = 0
    high = ary.count - 1

    while low <= high
      mid = (low + high) / 2
      if value > ary[mid]
        low = mid + 1
      elsif value < ary[mid]
        high = mid - 1
      else
        # Match return position
        return mid
      end
    end
    false
  end
end
