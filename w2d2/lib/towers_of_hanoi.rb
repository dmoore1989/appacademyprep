#!/usr/bin/env ruby

# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp/) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.




class TowersOfHanoi
  attr_reader :towers
  
  def initialize
    @towers = [[3, 2, 1], [], []]
  end
  
  def display
    @towers.each do |tower|
      print "["
      tower.each {|ring| print " #{ring} "}
      print "] "
    end
    puts ""
  end
    
  
  def move(from_tower, to_tower)
    if valid_move?(from_tower, to_tower)
      @towers[to_tower] << @towers[from_tower].pop
    end
  end

  def valid_move?(from_tower, to_tower)
    if from_tower > 2 || to_tower > 2
      puts "Wait, how did you screw that up? Pick a number between 1 and 3, it's not that hard"
      return false
    end
    if @towers[from_tower].empty?
      puts "Can't take from tower without rings. Try again you moron!"
      false
    elsif !@towers[to_tower][-1].nil? && @towers[to_tower][-1] < @towers[from_tower][-1]
      puts "Wow, you're thick. You can't place a larger ring on a smaller one. Try not to screw up this time"
      false
    else
      true
    end
  end
  
  def won?
    true if @towers == [[], [3, 2, 1], []] || @towers == [[], [], [3,2,1]]
  end
end


puts "Welcome to Towers of Hanoi!!!"
game = TowersOfHanoi.new
game.display
until game.won?
  puts "Please select a tower to take from ( 1, 2, or 3)"
  from = gets.chomp.to_i
  puts "Please select a tower to move ring to (1, 2, 3)"
  to = gets.chomp.to_i
  game.move(from - 1, to - 1)
  game.display
end
puts "Boo yah, you just won!"