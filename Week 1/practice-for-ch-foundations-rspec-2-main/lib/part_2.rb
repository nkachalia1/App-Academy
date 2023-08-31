def palindrome?(str)
    str.each_char.with_index do |char, i|
        if str[i] != str[-i-1]
            return false
        end
    end

    return true
end

def substrings(string)
    subs = []
    (0...string.length).each do |start_idx|
        (start_idx...string.length).each do |end_idx|
            subs << string[start_idx..end_idx]
        end
    end

    subs
end

def palindrome_substrings(str)
    substrings(str).select { |substring| palindrome?(substring) and substring.length > 1}
end
