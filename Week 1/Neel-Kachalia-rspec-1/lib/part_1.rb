def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    sum = 0.0
    arr.each do |ele|
        sum += ele
    end
    average = sum / arr.length
    return average
end

def repeat(str, num)
    str*num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent)
    words = sent.split(" ")
    new_sent = words.map.with_index do |word, i|
        if i % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end

    new_sent.join(" ")
end
