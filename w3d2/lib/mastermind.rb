
class Code
  attr_reader :pegs
  PEGS = {
    "r" => "red",
    "b" => "blue",
    "y" => "yellow",
    "o" => "orange",
    "g" => "green",
    "p" => "purple"}
    
  def initialize(pegs)
    @pegs = pegs
  end
  
  def [](index)
    pegs[index]
  end
  
  def self.parse(input)
    
    guess =""
    (0..3).each do |value|
      if PEGS.has_key?(input[value].downcase)
        guess << input[value].downcase
      else
        raise "invalid entry!!!"
      end
    end
    Code.new(guess)
  end
  
  def self.random
    random_pegs = [] 
    4.times {random_pegs << PEGS.keys.sample}
    Code.new(random_pegs.join(""))
  end
  
  def exact_matches(other_pegs)
    count = 0
    pegs.each_char.with_index do |guess, index|
      if guess == other_pegs[index]
        count += 1
      end
    end
    count
  end

  def near_matches(other_pegs)
    other_color_counts = other_pegs.color_counts
    
    near_matches = 0
    self.color_counts.each do |color, count|
      next unless other_color_counts.has_key?(color)
      near_matches += [count, other_color_counts[color]].min
    end
    
    near_matches - self.exact_matches(other_pegs)
      
  end
  
  
  def color_counts
    colors = Hash.new(0)
    pegs.each_char do |peg|
      colors[peg] += 1
    end
    colors
  end
  
  def ==(other_code)
    if other_code.is_a?(Code)
      return true if self.pegs == other_code.pegs
    end
    false
  end
end

class Game
  attr_reader :secret_code
  
  
  def initialize(secret_code = nil)
    @secret_code = secret_code.nil? ? secret_code = Code.random : secret_code
  end
  
  def get_guess
    puts "Guess the code:"
    guess = Code.parse(gets.chomp) 
  end
  
  def display_matches(code)
    puts "exact: #{code.exact_matches(@secret_code)}"
    puts "near: #{code.near_matches(@secret_code)}"
  end
  
end
