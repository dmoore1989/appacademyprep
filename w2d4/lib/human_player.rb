class HumanPlayer
  attr_accessor :name, :mark
  def initialize(name)
    @name = name
    @mark = mark
  end
  
  def get_move
    puts "where?"
    move = gets.chomp.split(", ").map {|num| num.to_i}
  end
  
  def display(board)
    board.grid.each do |row|
      row.each do |item|
        if item.nil?
          print "  "
        else
          print "#{item.to_s} "
        end
      end
      print "\n"
    end
  end

end
