class DynamicProgramming
  def self.fib(n)
    memo = {}
    fib_helper(n, memo)
  end

  def self.ugly_numbers(n)
    ugly_numbers = []
    ugly_numbers[0] = 1
    i2 = i3 = i5 = 0
    next_multiple_of_2 = 2
    next_multiple_of_3 = 3
    next_multiple_of_5 = 5

    (1..n).each do |i|
      next_ugly = [next_multiple_of_2, next_multiple_of_3, next_multiple_of_5].min
      ugly_numbers[i] = next_ugly
      if next_ugly == next_multiple_of_2
        i2 += 1
        next_multiple_of_2 = ugly_numbers[i2] * 2
      end
      if next_ugly == next_multiple_of_3
        i3 += 1
        next_multiple_of_3 = ugly_numbers[i3] * 3
      end
      if next_ugly == next_multiple_of_5
        i5 += 1
        next_multiple_of_5 = ugly_numbers[i5] * 5
      end
    end
    puts ugly_numbers.join(', ')
  end

  def self.ugly_memo(nth)
    memo = {1=> true}
    n = 2
    while memo.size <= nth
      if n % 2 == 0
        r = n / 2
        if memo.has_key?(r)
          memo[n] = true
        end
      elsif n % 3 == 0
        r = n / 3
        if memo.has_key?(r)
          memo[n] = true
        end
      elsif n % 5 == 0
        r = n / 5
        if memo.has_key?(r)
          memo[n] = true
        end
      end
      n += 1
    end
    puts memo.keys.join(', ')
  end

  def self.LCS(str1, str2)
  end

  private
  def fib_helper(n, memo)
    if n == 0 or n == 1
      memo[n] = n
    end

    if !memo.has_key?(n)
      memo[n] = fib_helper(n-1, memo) + fib_helper(n-2, memo)
    else
      memo[n]
    end
  end

  def ugly_helper(n, memo)
    if n == 1
      memo[n] = n
    end


  end

end
