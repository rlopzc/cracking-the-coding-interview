class Palindromes

  def find_all(array)
    h = Hash.new(0)
    array.each do |word|
      if h.has_key?(word.reverse)
        h[word.reverse] += 1
      else
        h[word] = 1
      end
    end
    h.select { |k, v| v >= 2}
  end
  #code
end
