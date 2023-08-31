# Your code here

def string_map!(str, &prc)
    prc.call(str)
end

def three?(arr, &prc)
    count = 0
    arr.each do |ele|
        if prc.call(ele)
            count +=1
        end
    end

    if count == 3
        true
    else
        false
    end
end

def nand_select(arr, proc_1, proc_2)
    new_arr = []
    arr.each do |ele|
        if !(proc_1.call(ele) && proc_2.call(ele))
            new_arr << ele
        end
    end

    new_arr
end

def hash_of_array_sum(hash)
    sum = 0
    hash.each do |key, value|
        sum += value.sum
    end

    sum
end

def abbreviate(sent)
    vowels = "aeiouAEIOU"
    arr = sent.split(" ")
    new_sent = []
    arr.each do |word|
        if word.length <= 4
            new_sent << word
        else
            new_word = ""
            word.each_char do |char|
                if !vowels.include?(char)
                    new_word << char
                end
            end
            new_sent << new_word
        end
    end

    new_sent.join(" ")
end

def hash_selector(hash, *arg)
    if !arg.any?
        return hash
    end
    new_hash = {}
    arg.each do |indiv|
        if hash[indiv]
            new_hash[indiv] = hash[indiv]
        end
    end

    new_hash
end
