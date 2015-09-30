#!/usr/bin/env ruby

require_relative "player"
require_relative "board"

class BattleshipGame
  attr_reader :board, :player, :win_count

  def initialize(player, board)
    @player1 = player
    @player2 = 
    @board = board
    @win_count = 0
  end
  
  def attack(pos)
    @board[*pos]= :x 
  end
  
  def count
    @board.count
  end
  
  def game_over?
    @board.won?
  end
  
  def play_turn(row = 10, collum = 10)
    board.display
    puts "#{player.name} has #{count} ships"
    self.attack(@player.get_play(row, collum))
    @win_count += 1
  end
  
  def win_message
    case win_count
      when 1..30
      puts "Look at you you over achiever"
      when 31..60
      puts "Alright!"
      when 60..9000
      puts "Your skills are bad and you should feel bad"
    end
  end
  
  def load_board
    10.times {board.place_random_ship}
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Battleshipz.............."
  puts "Enter your name:"
  player = HumanPlayer.new(gets.chomp)
  board = Board.new
  
  g = BattleshipGame.new(player, board)
  g.load_board
  until g.game_over?
    g.play_turn
    g.switch
  end
  puts "Youre winnar!" 
  puts "It took #{g.win_count} tries!"
  g.win_message
end