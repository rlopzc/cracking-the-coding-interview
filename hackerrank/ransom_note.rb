class RansomNote

=begin
  A kidnapper wrote a ransom note but is worried it will be traced back to him.
  He found a magazine and wants to know if he can cut out whole words from it
  and use them to create an untraceable replica of his ransom note. The words in
  his note are case-sensitive and he must use whole words available in the
  magazine, meaning he cannot use substrings or concatenation to create the
  words he needs.

  Given the words in the magazine and the words in the ransom note, print Yes
  if he can replicate his ransom note exactly using whole words from the
  magazine; otherwise, print No.

  Input Format

  The first line contains two space-separated integers describing the respective values of  (the number of words in the magazine) and  (the number of words in the ransom note).
  The second line contains  space-separated strings denoting the words present in the magazine.
  The third line contains  space-separated strings denoting the words present in the ransom note.
=end

  def self.ransom_note?
    m,n = gets.strip.split(' ')
    m = m.to_i
    n = n.to_i
    magazine = gets.strip
    magazine = magazine.split(' ')
    ransom = gets.strip
    ransom = ransom.split(' ')

    memo = Hash.new(0)

    ransom.each {|word| memo[word] += 1}
    magazine.each{|word| memo.has_key?(word) ? memo[word] -= 1 : word}

    if memo.select {|_key, value| value >= 1}.empty?
      puts "Yes"
    else
      puts "No"
    end
  end
end
