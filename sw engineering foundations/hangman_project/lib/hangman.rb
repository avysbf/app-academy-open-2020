class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.size, "_")
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
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    newarr = []
    @secret_word.each_char.with_index do |c, i|

      if c == char
        newarr << i
      end
    end
    newarr
  end

  def fill_indices(c, arr)
    arr.each {|i| @guess_word[i] = c}
  end

  def try_guess(chr)
    if already_attempted?(chr)
      puts "That has already been attempted."
      return false
    else
      @attempted_chars << chr
      if get_matching_indices(chr).empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(chr, get_matching_indices(chr))
      end
      true
    end

  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      true
    else
      false
    end
  end
end
