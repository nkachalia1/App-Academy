def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    words = sentence.split(" ")
    new_words = []

    words.each do |word|
        new_words << prc.call(word)
    end

    new_words.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    result_1 = prc_1.call(num)
    result_2 = prc_2.call(num)

    if result_1 > result_2
        return result_1
    else
        return result_2
    end
end

def and_selector(array, prc_1, prc_2)
    selected = []

    array.each do |element|
        if prc_1.call(element) and prc_2.call(element)
            selected << element
        end
    end

    selected
end

def alternating_mapper(array, proc_1, proc_2)
    mapped = []

    array.each_with_index do |element, i|
        if i.even?
            mapped << proc_1.call(element)
        else
            mapped << proc_2.call(element)
        end
    end

    mapped
end
