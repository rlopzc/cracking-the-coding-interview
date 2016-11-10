=begin
/ Write a method that for a given input string, reverse all the characters inside parentheses. Consider nested parentheses.

foobarbaz =>
foobarbaz

foo(bar)baz =>
foorabbaz

foo(bar(baz))blim =>
foo(barzab)blim =>
foobazrabblim

foo(bar(baz))blim(abc) =>
foo(barzab)blim(abc) =>
foobazrabblimcba

=end

class Ejercicio
  def reverse(string)
    memo = []
    string.size.times do |i|
      if string[i] == '('
        memo.push(i)
      elsif string[i] == ')'
        start = memo.pop
        string[(start+1)..(i-1)] = string[(start + 1)..(i-1)].reverse
      end
    end
    puts string.delete('()')
  end
end
