def element_count(arr)
    new_Hash = Hash.new(0)
    arr.each { |ele| new_Hash[ele] += 1}
    new_Hash
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, idx|
        if hash[char]
            str[idx] = hash[char]
        end
    end

    str
end

def product_inject(arr)
    arr.inject {|product, number| product * number}
end
