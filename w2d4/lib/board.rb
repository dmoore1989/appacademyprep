class Board
  attr_reader :grid :marks
  
  def initialize(grid = nil)
    @grid = grid.nil? ? Array.new(3) { Array.new(3) } : grid
    @marks = [:X, :O]
  end
  
  def [](row, col)
    @grid[row][col]
  end
  
  def []=(row, col, mark)
    @grid[row][col] = mark
  end
  
  def place_mark(pos, mark)
    self[*pos] = mark
  end
    
  def empty?(pos)
    self[*pos].nil?
  end
  
  def winner
    left_diag = []
    right_diag = []
    @grid.each_with_index do |row, i|
      if row[0] == row[1] && row[1] == row[2] && !row[0].nil?
        return row[0]
      end
      left_diag << row[i]
      right_diag << row[-(i + 1)]
    end
    if left_diag[0] == left_diag[1] && left_diag[1] == left_diag[2] && !left_diag[0].nil?
      return left_diag[0]
    end
    if right_diag[0] == right_diag[1] && right_diag[1] == right_diag[2] && !right_diag[0].nil?
      return right_diag[0]
    end
    collums = Board.new(@grid.transpose)
    collums.grid.each do |collum|
      if collum[0] == collum[1] && collum[1] == collum[2] && !collum[0].nil?
        return collum[0]
      end
    end
    nil
  end
  
  def over?
    if !winner.nil?
      true
    elsif filled?
      true
    else
      false
    end
  end

  def filled?
    @grid.each do |row|
      row.each do |item|
        return false if item.nil?
      end
    end
    true
  end
        
end