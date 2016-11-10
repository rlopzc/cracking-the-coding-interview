class Arrays

  def reverse(array)
    array.reverse_each do |i|
      print "#{i} "
    end
  end

  def 2d_array_hourglass(array)
    max = nil
    4.times do |i|
      4.times do|j|
        sum = array[i][j] + array[i][j+1] + array[i][j+2] + array[i+1][j+1] + array[i+2][j] + array[i+2][j+1] + array[i+2][j+2]
        if max == nil
          max = sum
        else
          max = [max, sum].max
        end
      end
    end
    puts max
  end

  def left_rotation(array, steps)
    steps.times do
      array.push(array.shift)
    end
    puts array.join(' ')
  end

  def sparse_arrays(array)
    strings = Hash.new(0)

    gets.chomp.to_i.times do
      strings[gets.chomp] += 1
    end

    gets.chomp.to_i.times do
      puts strings[gets.chomp]
    end
  end
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
    puts array.join(' ')
  end
end
