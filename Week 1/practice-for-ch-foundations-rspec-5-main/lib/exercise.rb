def zip(*arr)
    mega = [*arr]
    num_rows_to_be = mega[0].length
    num_columns_to_be = mega.length
    final_arr = Array.new(num_rows_to_be){Array.new(num_columns_to_be)}

(0...num_rows_to_be).each do |row|
    (0...num_columns_to_be).each do |column|
        final_arr[row][column] = mega[column][row]
    end
end

return final_arr
end


def prizz_proc(arr, proc_1, proc_2)
    new_arr = []
    arr.each do |ele|
        if (proc_1.call(ele) and !proc_2.call(ele)) or (!proc_1.call(ele) and proc_2.call(ele))
            new_arr << ele
        end
    end

    new_arr
end

def zany_zip(*arr)
        mega = [*arr]
        num_rows_to_be = mega.max_by(&:size).size
        num_columns_to_be = mega.length
        final_arr = Array.new(num_rows_to_be){Array.new(num_columns_to_be)}

    (0...num_rows_to_be).each do |row|
        (0...num_columns_to_be).each do |column|
            if !mega[column][row]
                final_arr[row][column] = nil
            else
                final_arr[row][column] = mega[column][row]
            end
        end
    end

    return final_arr
end


def maximum(arr, &prc)
    current = -1 / 0.0
    if !arr
        return nil
    end
    arr.each_with_index do |ele, i|
        if prc.call(ele) >= current
            current = prc.call(ele)
            $index = i
        end
    end

    arr[$index]
end

def my_group_by(arr, &prc)
    ht1 = Hash.new {|h,k| h[k]=[]}
    arr.each do |ele|
        ht1[prc.call(ele)] << ele
    end

    ht1
end

def max_tie_breaker(arr, proc_1, &prc)
    max = -1 / 0.0

    if arr.empty?
        return nil
    end

    arr.each_with_index do |ele, i|
        if prc.call(ele) > max
            max = prc.call(ele)
            $index = i
            $element = ele
        elsif prc.call(ele) == max
            if proc_1.call(ele) > proc_1.call(arr[$index])
                $element = ele
            else
                $element = arr[$index]
            end
        end
    end

    $element
end

def silly_syllables(sent)
    sent_arr = sent.split(" ")
    vowels = "aeiouAEIOU"
    final_arr = []

    sent_arr.each do |word|
        count = 0
        word.each_char.with_index do |letter, i|
            if vowels.include?(letter)
                count += 1
            end
        end

        if count <= 2
            final_arr << word
        else
            word.each_char.with_index do |letter, i|
                (0...word.length).each do |i|
                    if vowels.include?(word[i])
                        $beginning = i
                        break
                    end
                end
                (-1..(-1*word.length)).each do |idx|
                    if vowels.include?(word[idx])
                        $ending = idx
                        break
                    end
                end
            end

            final_arr << word[$beginning..$ending]
        end
    end

    return final_arr.join(" ")
end
