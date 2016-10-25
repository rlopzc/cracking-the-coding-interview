class OtherProblems
  def self.reverse_str(str)
    # str.reverse
    # str.chars.reverse.join
    word = ''
    chars = str.chars
    chars.size.times{word += chars.pop}
    word
  end

  def self.duplicate(str)
    return 'Error' if str == nil || str.empty?
    memo = {}
    str.each_char { |chr| memo.has_key?(chr) ? memo[chr] += 1 : memo[chr] = 0 }
    memo.select{|_,val| val >= 1}.keys
  end

  def self.anagram?(str1, str2)
    str1.downcase.chars.sort.join == str2.downcase.chars.sort.join
  end

  def self.non_repeated(str)
    memo = {}
    str.each_char { |chr| memo.has_key?(chr) ? memo[chr] += 1 : memo[chr] = 1}
    memo.select{|_, val| val == 1}.keys.first
  end

  def self.only_digits?(str)
    Float(str) != nil rescue false
  end

  def self.vowels_and_consonants(str)
    vowels = %w(a e i o u)
    v  = c = 0
    str.each_char { |chr| vowels.include?(chr) ? v += 1: c += 1 }
    puts "V: #{v}, C: #{c}"
  end

  def self.reverse_words(sent)
    sent.split(' ').reverse.join (' ')
  end

  def self.remove_duplicate(word)
    memo = {}
    word.each_char { |chr| memo.has_key?(chr) ? '' : memo[chr] = 0 }
    memo.keys.join
  end

  def self.sort_by_length(ary)
    ary.sort{|x| x.length}
  end

  def self.unique_characters?(str)
    memo = []
    str.each_char do |chr|
      value = chr.ord
      if memo[value]
        return false
      else
        memo[value] = true
      end
    end
    true
  end

  def self.permutation?(str1, str2)
    return false if str1.size != str2.size
    str1.chars.sort.join == str2.chars.sort.join
  end

  def self.URLify(sentence, true_length)
    # sentence.split(' ').join('%20')
    sentence.gsub!(' ', '%20')

    return false if sentence.length != length
    sentence
  end

  def self.one_away(str1, str2)
    memo = {}
    str1.each_char { |chr| memo[chr] = 1 }

    # Comparamos el string 2 con el hash y empezamos a contar
    str2.each_char { |chr| memo.has_key?(chr) ? memo[chr] += 1 : chr }

    size_of_same_chars = memo.select{ |_, val| val > 1}.size
    if size_of_same_chars == str1.size - 1 || size_of_same_chars == str1.size || size_of_same_chars + 1 == str1.size
      return true
    end
    false
  end

  def self.string_compression(str)
    times = 1
    compressed = []
    str.size.times do |i|
      next if i == 0
      if str[i] == str[i-1]
        # Sumamos y concatenamos
        times += 1
      else
        compressed << str[i-1]
        compressed << times.to_s
        times = 1
        # Cambiamos de caracter
      end
    end
    compressed << str[-1]
    compressed << times.to_s
    compressed.size >= str.size ? str : compressed.join
  end

  def self.matrix(matrix)
    r = matrix.length
    c = matrix[0].length

    r.times do |row|
      c.times do |col|
        # TODO a implementar
      end
    end
  end

  def self.reverse_array(array)
    (array.size / 2).times do |i|
      last = array.size - i - 1
      tmp = array[i]
      array[i] = array[last]
      array[last] = tmp
    end
    true
  end
end
