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
    @low_grid = []
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
      if @low_count.nil? || @counter < @low_count
        @low_grid = @grid
        @low_count = @counter
      end
    elsif move_available?(" ")
      make_move(" ")
    else
      clear_maze
    end
  end

  def clear_maze
    @grid = @grid_copy
  end


  def move_available?(value)
    @grid[position[0]][position[1] + 1] == value ||
    @grid[position[0] + 1][position[1]] == value ||
    @grid[position[0]][position[1] - 1] == value ||
    @grid[position[0] - 1][position[1]] == value
  end

  def make_move(value)
    # p "in make move"
    test_position(position[0] + 1, position[1], value)
    test_position(position[0], position[1] + 1, value)
    test_position(position[0] - 1, position[1], value)
    test_position(position[0], position[1] - 1, value)

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
    @low_grid.each do |line|
      puts line
    end
    puts @low_count
  end

  def test_position(row, col, value)
    # p "in test position"
    # print_maze
    if self.grid[row][col] == value
      @position  = [row, col]
      @counter += 1
      find_next_move if value == " "
    end
  end
end
