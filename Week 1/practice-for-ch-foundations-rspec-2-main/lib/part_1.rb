def partition(array, num)
    less = []
    greater_or_equal = []

    array.each do |element|
        if element < num
            less << element
        else
            greater_or_equal << element
        end
    end

    [less, greater_or_equal]
end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each { |key, value| new_hash[key] = value}
    hash_2.each { |key, value| new_hash[key] = value}
    new_hash
end

def censor(sent, arr)
    words = sent.split(" ")
    new_words = words.map do |word|
        if arr.include?(word.downcase)
            star_vowels(word)
        else
            word
        end
    end

    new_words.join(" ")
end

def star_vowels(string)
    vowels = "aeiou"
    new_str = ""

    string.each_char do |char|
        if vowels.include?(char.downcase)
            new_str += "*"
        else
            new_str += char
        end
    end

    new_str
end

def power_of_two?(num)
    product = 1
    while product < num
        product *= 2
    end

    product == num
end
