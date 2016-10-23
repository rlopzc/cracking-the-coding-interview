class MakingAnagrams

=begin
  Alice is taking a cryptography class and finding anagrams to be very useful.
  We consider two strings to be anagrams of each other if the first string's
  letters can be rearranged to form the second string. In other words, both
  strings must contain the same exact letters in the same exact frequency For
  example, bacdc and dcbac are anagrams, but bacdc and dcbad are not.

  Alice decides on an encryption scheme involving two large strings where
  encryption is dependent on the minimum number of character deletions
  required to make the two strings anagrams. Can you help her find this number?

  Given two strings,  and , that may or may not be of the same length,
  determine the minimum number of character deletions required to make
  and  anagrams. Any characters can be deleted from either of the strings.
=end

  def number_needed
    a = gets.strip
    b = gets.strip
    memo = Hash.new(0)
    a.chars.each {|ch| memo[ch] += 1 }

    b.chars.each {|ch| memo[ch] -= 1}

    puts memo.values.reduce(0){|acc, n| acc + n.abs}
  end

end
