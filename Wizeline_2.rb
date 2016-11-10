class Hola

def integer_adder(ary_1, ary_2)
    max_size_ary = ary_1.size >= ary_2.size ? ary_1 : ary_2
    less_size_ary = ary_1.size >= ary_2.size ? ary_2 : ary_1
    carry = 0
    result = []
    # Iterar de atras para adelante
    max_size_ary.size.times do |i|
        # Ultimo elemento = -1
        index = -(i+1)
        if less_size_ary.empty?
            sum = max_size_ary[index]
        else
            sum = max_size_ary[index] + less_size_ary[-1]
            less_size_ary.pop
        end
        sum += carry
        carry = 0
        if sum > 9
            carry = 1
            sum = sum - 10
        end
        result.unshift(sum)
    end
    if carry > 0
        result.unshift(carry)
    end
    return result
end
end
