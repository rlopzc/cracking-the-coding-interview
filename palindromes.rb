class Palindromes

  # Hash implementation
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

  def self.string_palindrome_inplace?(string)
    mid = string.length / 2
    mid.times do |i|
      return false if string[i] != string[-(i+1)]
    end
    true
  end

  def self.string_palindrome_stack?(string)
    s = []
    mid = string.length / 2
    mid.times do |i|
      s.push(string[i])
    end
    mid.times do |i|
      return false if s.pop != string[mid + i + 1]
    end
    true
  end

  def self.string_palindrome_recursive?(string)
    palindrome_recursive_helper(string, 0, string.length / 2)
  end

  def self.palindrome_recursive_helper(string, index, mid)
    puts "#{string[index]} --- #{string[-(index + 1)]}"
    if index + 1 == mid
      return string[index] == string[-(index + 1)]
    end
    string[index] == string[-(index + 1)] && palindrome_recursive_helper(string, index + 1, mid)
  end
end
