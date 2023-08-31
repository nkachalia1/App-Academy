def is_prime?(num)
    if num < 2
        return false
    end

    if num == 2
        return true
    end

    (2...num).each do |divisor|
        if num % divisor == 0
            return false
        end
    end

    return true
end


def nth_prime(n)
    count = 0
    number = 2
    while count < n
        if is_prime?(number)
            count += 1
            if count == n
                return number
            else
                number += 1
            end
        else
            number += 1
        end
    end

   return number
end

def prime_range(min, max)
    arr = []
    (min..max).each do |check|
        if is_prime?(check)
            arr << check
        end
    end

    arr
end
