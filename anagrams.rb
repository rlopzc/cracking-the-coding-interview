class Anagram
  def find_anagrams(words)
    #code
    anagrams = Hash.new { |hash, key| hash[key] = [] }
    words.each do |w|
      sorted = w.downcase.chars.sort.join
      anagrams.has_key?(sorted) ? anagrams[sorted] << w : anagrams[sorted] = [w]
    end
    anagrams.each do |key, val|
      puts key
      val.each do |v|
        puts "  - #{v}"
      end
    end
  end
end

words = %w(The Words With Friends® Cheat from YourDictionary is the perfect help
you need. Enter your tiles to find a list of words. Our word finder scans the
dictionary to deliver complete word lists sorted by word length and base points
 so you can easily find the highest scoring word. Read more at Any single
 non-alpha-numeric character can be used as the delimiter, %[including these],
 %?or these?, %~or even these things~. By using this notation, the usual string
 delimiters " and ' can appear in the string unescaped, but of course the new
 delimiter you've chosen does need to be escaped. However, if you use
 %(parentheses), %[square brackets], %{curly brackets} or %<pointy brackets>
 as delimiters then those same delimiters can appear unescaped in the string
 as long as they are in balanced pairs: natics, quick results can be sorted
 either by length or by score all while learning the definitions when clicking
on the word. If you happen to be a Scrabble Superhuman, like our Mr.
Anagrammer, you can outplay the best of the best on the web with our cheat
solver. If you're a Scrabble Starter and are just entering the world, or war,
of words, start expanding your vocabulary with our handy word lists which
will surely impress your opponents, friend or foe. Develop your strategic
skills, improve your vocabulary, or 'outcheat' a cheater by using the tools on
our site. We do not promote cheating, but sometimes you have to fight fire with
fire, or in this case, sometimes you have to fight Scrabble bingo with Scrabble
bingo. But remember, the choice is yours, so play responsibly!)

 ana = Anagram.new
 ana.find_anagrams(words)
