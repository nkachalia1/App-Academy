class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = []
    @secret_word.length.times do
      @guess_word << "_"
    end
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    new_arr = []
    @secret_word.each_char.with_index do |c, i|
      if c == char
        new_arr << i
      end
    end

    new_arr
  end

  def fill_indices(char, arr)
    arr.each do |idx|
      @guess_word[idx] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if !@secret_word.include?(char)
        @remaining_incorrect_guesses -= 1
      end
      matches = self.get_matching_indices(char)
      self.fill_indices(char, matches)
      return true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? or self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end
end
