class Maze
  attr_accessor :grid, :position
  
  def initialize(file)
    @file = file
    @grid = File.readlines(file)
    @grid_copy = @grid
    @grid_store = []
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
    # debugger
    if make_move("E")
      debugger
        # debugger
        @low_count = @counter
        @grid_solution = @grid
        print_maze
    end
    
    make_move(" ")

  end
  
  def make_move(value)
    position_store = @position
    grid_store = @grid
    test_position(position[0] + 1, position[1], value)
    test_position(position[0], position[1] + 1, value)
    test_position(position[0] - 1, position[1], value)
    test_position(position[0], position[1] - 1, value)
    @grid = grid_store
    @position = position_store
    false
  end
  
  def find_next_move
    @grid[position[0]][position[1]] = "x"
    find_solution 
  end
    
  def find_start
    @grid.each_with_index do |line, i|
      return [i, line.index("S")] if line.include?("S")
    end
  end
  
  def print_maze
    @grid_solution.each do |line|
      puts line
    end
    puts @low_count
  end
  
  def test_position(row, col, value)
    grid_store = @grid
    position_store = @position
    if self.grid[row][col] == value
      @position  = [row, col]
      @counter += 1
      find_next_move if value == " "
      true
    end
    @grid = grid_store
    @position = position_store
    false
  end  
end