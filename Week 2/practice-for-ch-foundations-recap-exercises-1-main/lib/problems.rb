# Write a method, all_vowel_pairs, that takes in an array of words and returns
# all pairs of words that contain every vowel. Vowels are the letters a, e, i,
# o, u. A pair should have its two words in the same order as the original
# array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  vowels = ["a", "e", "i", "o", "u"]
  pairs = []
  words.each_with_index do |word_1, idx_1|
    words.each_with_index do |word_2, idx_2|
      pair = word_1 + " " + word_2
      if (vowels.all? { |vowel| pair.include?(vowel) }) and (idx_2 > idx_1)
        pairs << pair
      end
    end
  end

  pairs
end

# Write a method, composite?, that takes in a number and returns a boolean
# indicating if the number has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true composite?(13)    # => false
def composite?(num)
  (2...num).each do |factor|
    if num % factor == 0
      return true
    end
  end

  return false
end

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the order of their appearance in the
# original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  str.delete(" ")
  new_arr = []
  bigrams.each do |ele|
    if str.include?(ele)
      new_arr << ele
    end
  end

  new_arr
end

# Write a method, Hash#my_select, that takes in an optional proc argument
# The method should return a new hash containing the key-value pairs that return
# true when passed into the proc.
# If no proc is given, then return a new hash containing the pairs where the key
# is equal to the value.
#
# Examples:
#
# hash_1 = {x: 7, y: 1, z: 8}
# hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
#
# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# hash_2.my_select                            # => {4=>4}
class Hash
  def my_select(&prc)
    new_hash = {}
    if !prc
      self.each do |k, v|
        if k == v
          new_hash[k] = v
        end
      end
    else
      self.each do |k, v|
        if prc.call(k, v)
          new_hash[k] = v
        end
      end
    end

    new_hash
  end
end



# Write a method, String#substrings, that takes in a optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.
#
# Examples:
#
# "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# "cats".substrings(2)  # => ["ca", "at", "ts"]
class String
  def substrings(length = nil)
    arr = []
    new_arr = []
    (0...self.length).each do |idx_1|
      (idx_1...self.length).each do |idx_2|
        arr << self[idx_1..idx_2]
      end
    end

    if length == nil
      return arr
    else
      arr.each do |sub|
        if sub.length == length
          new_arr << sub
        end
      end
      return new_arr
    end
  end
end

# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string
# is shifted the given number of times in the alphabet.
#
# Examples:
#
# "apple".caesar_cipher(1)    #=> "bqqmf"
# "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# "zebra".caesar_cipher(4)    #=> "difve"
class String
  def caesar_cipher(num)
    new_str = ""
    alpha = ("a".."z").to_a
    self.each_char do |char|
      start_pos = alpha.index(char)
      new_pos = (start_pos + num) % 26
      new_str += alpha[new_pos]
    end
    new_str
  end
end
