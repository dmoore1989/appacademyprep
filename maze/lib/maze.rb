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
    # p "find soution"
    # debugger
    if move_available?("E")
      make_move("E")
      print_maze
      clear_maze
    elsif move_available?(" ")
      make_move(" ")
    else
      return
    end
  end

  def clear_maze


  def move_available?(value)
    @grid[position[0]][position[1] + 1] == value ||
    @grid[position[0] + 1][position[1]] == value ||
    @grid[position[0]][position[1] - 1] == value ||
    @grid[position[0] - 1][position[1]] == value
  end

  def make_move(value)
    # p "in make move"
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
    # p "in find next move"
    @grid[position[0]][position[1]] = "x"
    find_solution
  end

  def find_start
    # p "in find start"
    @grid.each_with_index do |line, i|
      return [i, line.index("S")] if line.include?("S")
    end
  end

  def print_maze
    # p "in print maze"
    # p @grid
    # p @grid_solution
    @grid.each do |line|
      puts line
    end
    puts @low_count
  end

  def test_position(row, col, value)
    # p "in test position"
    grid_store = @grid
    position_store = @position
    print_maze
    if self.grid[row][col] == value
      @position  = [row, col]
      @counter += 1
      find_next_move if value == " "
      true
    end
    @counter -= 1
    @grid = grid_store
    @position = position_store
  end
end
