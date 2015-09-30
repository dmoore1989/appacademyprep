#!/usr/bin/env ruby

require_relative "maze"
require 'byebug'


maze = Maze.new(ARGV[0])
maze.position = maze.find_start
# debugger

maze.find_solution
maze.print_maze


