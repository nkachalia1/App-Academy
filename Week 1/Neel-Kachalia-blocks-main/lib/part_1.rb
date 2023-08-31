def select_even_nums(arr)
    arr.select { |n| n.even?}
end

def reject_puppies(hash)
    hash.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |sub_arr| sub_arr.sum > 0}
end

def aba_translate(str)
    vowels = "aeiou"
    new_word = ""

    str.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end
    new_word
end

def aba_array(arr)
    arr.map { |word| aba_translate(word)}
end
