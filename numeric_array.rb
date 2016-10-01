class NumericArray
  def find_positive(numbers)
    answer = []
    hsh = {}
    numbers.each do |n|
      # Comparamos si el numero esta en el hash
      n_abs = n.abs
      if hsh[n_abs] == -n
        answer << n
      else
        hsh[n_abs] = n
      end
      puts hsh
    end
    puts answer
  end
end

n = NumericArray.new
numbers = [-7]

n.find_positive(numbers)
