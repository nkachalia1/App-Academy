# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.


def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0}
end

def largest_prime_factor(num)
    num.downto(2) do |factor|
        if num % factor == 0 and prime?(factor)
            return factor
        end
    end
end

def unique_chars?(str)
    seen = []
    str.each_char do |char|
        if seen.include?(char)
            return false
        end
        seen << char
    end
    return true
end

def dupe_indices(array)
    new_hash = Hash.new{ |hash, key| hash[key] = [] }
    array.each_with_index do |letter, i|
        new_hash[letter] << i
    end

    new_hash.select { |letter, arr| arr.length > 1}
end

def ana_array(arr_1, arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    arr_1.each { |word| hash_1[word] += 1 }
    arr_2.each { |word| hash_2[word] += 1 }

    if hash_1 == hash_2
        return true
    else
        return false
    end
end
