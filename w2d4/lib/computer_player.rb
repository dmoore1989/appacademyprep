class ComputerPlayer
  require 'byebug'
  attr_accessor :mark
  attr_reader :name, :board
  
  def initialize(name)
    @name = name
  end
  
  def get_move
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
      moves << [row, col] if board[row,col].nil?
      end
    end
    
    moves.each do |move|
      return move if wins?(move)
    end
    
    moves.sample
  end
  
  def display(board)
    @board = board
  end
  
  def wins?(move)
    board[*move] = mark
    if board.winner == mark
      board[*move] = nil
      true
    else
      board[*move] = nil
      false
    end
  end

end
