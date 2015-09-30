class Board
  attr_reader :grid
  
  def initialize(grid = nil)
    @grid = grid.nil? ? Board.default_grid : grid 
  end
    
  def Board.default_grid
    Array.new(10) {Array.new(10)}
  end
  
  def [](row, col)
    @grid[row][col]
  end
  
  def []=(row, col, value)
    @grid[row][col] = value
  end
  
  def display
    print "-"
    10.times {|var| print "-#{var}" }
    print "-"
    puts
    @grid.each_with_index do |row, index|
      print index
      row.each do |item|
        print "-"
        if item == :x
          print "x"
        elsif item == :s
          print "O"
        else
          print "O"
        end
      end
      puts
      puts "--"*11
    end
  end
  
  def count
    count = 0
    @grid.each do |row|
      row.each do |spot|
        count += 1 if spot == :s
      end
    end
    count
  end

  def empty?(pos = nil)
    if pos.nil?
      count == 0
    else
      self[*pos].nil?
    end
  end
  
  def full?
    count == @grid.length * @grid[0].length
  end
  
  def place_random_ship
    unless full?
      row = rand(@grid.length) 
      col = ran d(@grid.length)
      until self[row, col] != :s
        row = rand(@grid.length) 
        col = rand(@grid.length)
      end
      self[row, col] = :s 
    else
      raise "error"
    end
  end

  def won?
    empty?
  end
end
