class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def get_play(row = 10, collum = 10)
    until row < 10 && collum < 10
      puts "Enter row (0 - 9):"
      row = gets.chomp.to_i
      puts "Enter collum (0 - 9):"
      collum = gets.chomp.to_i
      if row >= 10 || collum >= 10
        puts "Invalid entry, must be <10"
      end
    end
    [row, collum]
  end
end

class ComputerPlayer < HumanPlayer
  
  def initialize(name)
    @name = name
    @comp_arr = []
  end
  
  def get_play
    row = nil
    col = nil
    until @comp_arr.include?([row, col])
      row = rand(10)
      col = rand(10)
      @comp_arr << [row,col]
    end  
    [row, col]
  end  
end
