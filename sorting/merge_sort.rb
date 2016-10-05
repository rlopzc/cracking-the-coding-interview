class MergeSort

  def merge_sort(ary1, ary2)
    merged = ary1 + ary2
    merge_helper(merged)
  end

  private

  def merge_helper(ary)
    return ary if ary.size <= 1
    mid = ary.size / 2
    # Divide!
    left_part = merge_helper(ary[0..(mid-1)])
    right_part = merge_helper(ary[mid..-1])

    # Conquer!
    merge(left_part, right_part)
  end

  def merge(left, right)
    new_ary = []
    index_left = index_right = 0
    while index_left < left.size && index_right < right.size
      if left[index_left] <= right[index_right]
        new_ary << left[index_left]
        index_left += 1
      else
        new_ary << right[index_right]
        index_right += 1
      end
    end

    while index_left < left.size
      new_ary << left[index_left]
      index_left += 1
    end
    while index_right < right.size
      new_ary << right[index_right]
      index_right += 1
    end
    new_ary
  end
end
