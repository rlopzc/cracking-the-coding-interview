class Subarray
  def continuous(array)
    max_ending_here = max_so_far = array.first
    array.each_with_index do |n, index|
      next if index == 0
      max_ending_here = [0, max_ending_here + n].max
      max_so_far = [max_ending_here, max_so_far].max
    end
    max_so_far
  end

end
