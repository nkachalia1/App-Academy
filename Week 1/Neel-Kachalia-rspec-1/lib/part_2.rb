def hipsterfy(word)
    word.reverse.sub(/[aeiou]/, "").reverse
end

def vowel_counts(str)
    new_hash = Hash.new(0)
    vowels = "aeiou"

    str.each_char do |char|
        if vowels.include?(char.downcase)
            new_hash[char.downcase] += 1
        end
    end
    new_hash
end

def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
    new_str = ""

    str.each_char do |char|
        if alphabet.include?(char)
            idx = alphabet.index(char)
            new_idx = (idx + num) % 26
            new_str += alphabet[new_idx]
        else
            new_str += char
        end
    end

    new_str
end
