class Permutation

  def find(letters, word)
    ordered = letters.chars.sort.join
    word = word.chars
    n_words = 0
    (word.length - 3).times do |i|
      n_words +=1 if ordered == word[i..i+3].sort.join
    end
    n_words
  end

end



p = Permutation.new

letts = 'abbc'
word = 'cbabadcbbabbcbabaabccbabc'

puts p.find(letts, word)

# 0, 1, 2, 3
# Roma
# omar
# mari
# ario
