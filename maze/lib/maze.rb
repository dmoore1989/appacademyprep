class Maze
  attr_accessor :grid, :position
  
  def initialize(file)
    @grid = File.readlines(file)
    @position = []
    @counter = 0
    @low_count = nil
    @grid_solution = []
  end
  
  # def [](row, col)
  #   @grid[row][col]
  # end
  
  # def []=(row, col, mark)
  #   @grid[row][col] = mark
  # end
  
  def find_solution
    @position = find_start
    # debugger
    while true
      break if make_move("E")
      make_move(" ")
      @grid[position[0]][position[1]] = "x"
    end
    print_maze
  end
  
  def make_move(value)
    if self.grid[position[0] + 1][position[1]] == value
      @position  = [position[0] + 1, position[1]]
    elsif self.grid[position[0]][position[1] + 1] == value
      @position  = [position[0], position[1] + 1]
    elsif self.grid[position[0] - 1][position[1]] == value
      @position  = [position[0] - 1, position[1]]
    elsif self.grid[position[0]][position[1] - 1] == value
      @position = [position[0], position[1] - 1]
    end
  end  
      
  
  def fill_grid(row, col)
    @position = [row, col]
    @grid[row][col] = "x"
  end
    
    
  def find_start
    self.grid.each_with_index do |line, i|
      return [i, line.index("S")] if line.include?("S")
    end
  end
  
  def finished?
    grid[position[0]][position[1]] == "E"
  end
  
  def print_maze
    @grid.each do |line|
      puts line
    end
  end
end