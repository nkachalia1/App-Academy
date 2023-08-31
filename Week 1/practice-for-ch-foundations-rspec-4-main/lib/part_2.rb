def proper_factors(num)
    arr = []
    (1...num).each do |divisor|
        if num % divisor == 0
            arr << divisor
        end

    end

    arr
end

def aliquot_sum(num)
    array = proper_factors(num)
    array.sum()
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(num)
    count = 0
    start = 6
    arr = []
    while count < num
        if perfect_number?(start)
            count += 1
            arr << start
            start += 1
        else
            start += 1
        end
    end

    arr
end
