class Hangman
  attr_reader :guesser, :referee, :board
  
  def initialize(players)
    @referee = players[:referee]
    @guesser = players[:guesser]
  end
  
  def setup
    secret_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_length)
    @board= Array.new(secret_length)
  end 
  
  def take_turn
    answers = @referee.check_guess(@guesser.guess)
    update_board(answers)
    @guesser.handle_response
  end
  
  def update_board(answers)
  end
  
  
end



class ComputerPlayer
  
  attr_reader :secret_word, :dictionary
  
  def initialize(dictionary)
    @dictionary = dictionary
    @remaining_words = []
  end
  
  def pick_secret_word
    @secret_word = dictionary.sample.to_s
    @secret_word.length
  end
  
  def register_secret_length(length)
    @remaining_words = @dictionary.select{|word| word.length <= length}  
  end
  
  def candidate_words
    @remaining_words
  end

    
  
  def check_guess(guess)
    chr_indices = []
    @secret_word.each_char.with_index do |letter, index|
      if letter == guess
        chr_indices << index
      end
    end
    chr_indices
  end
  
  def handle_response(letter, positions)
    if positions.length == 0
      @remaining_words = @remaining_words.select {|word| !word.include?(letter)}
    else
      @remaining_words = @remaining_words.select {|word| evaluate_indices(word, letter, positions)}
    end
  end
  
  def evaluate_indices(word, letter, positions)
    value = false
    word.each_char.with_index do |chr, index|
      if chr == letter && positions.include?(index)
        value = true
      elsif chr == letter
        return false
      end
    end
    value
  end
  
  def guess(board)
    alphabet_count = Hash.new(0)
    board_count = Hash.new([])
   
    board.each_with_index do |value, index|
      board_count[value] << index unless value.nil?
    end
    board_count.each {|key, value| handle_response(key, value)}
    
    
    candidate_words.each do |word|
      word.each_char do |letter|
        alphabet_count[letter] += 1 unless board.include?(letter)
      end
    end
    
    value = alphabet_count.values.max
    alphabet_count.key(value)
  
  end
end

class HumanPlayer < ComputerPlayer

end