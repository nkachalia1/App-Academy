# Your code here

def first_letter_vowel_count(sent)
    array = sent.split(" ")
    count = 0
    vowels = "aeiouAEIOU"

    array.each do |word|
        if vowels.include?(word[0])
            count += 1
        end
    end

    count
end

def count_true(array, proc_1)
    selected = []
    array.each do |element|
        if proc_1.call(element)
            selected << element
        end
    end

    return selected.length
end

def procformation(array, proc_1, proc_2, proc_3)
    selected = []
    array.each do |element|
        if proc_1.call(element)
            selected << proc_2.call(element)
        else
           selected << proc_3.call(element)
        end
    end

    selected
end

def array_of_array_sum(array)
    array.flatten.sum
end

def selective_reverse(sent)
    vowels = "aeiou"
    array = sent.split(" ")
    new_list = []

    array.each do |word|
        if !vowels.include?(word[0]) and !vowels.include?(word[-1])
            new_list << word.reverse
        else
            new_list << word
        end
    end

    new_list.join(" ")
end

def hash_missing_keys(hash, *args)
    array = []
    new_arr = []
    args.each do |arg|
        array << arg
    end

    array.each do |n|
        if !hash[n]
            new_arr << n
        end
    end

    new_arr
end
