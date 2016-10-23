class Arrays

  # Time  O(n)
  # Space O(n)
  def self.rotate_1(array, steps)
    a_dup = array.dup
    array.size.times do |i|
        array[i - steps] = a_dup[i]
    end
    puts array.join(' ')
  end

  # Time  O(n)
  # Space O(1)
  def self.rotate_2(array, steps)
    steps.times do
      array.push(array.shift)
    end
  end
end
