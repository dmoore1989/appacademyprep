#!/usr/bin/env ruby

require_relative "maze"
require 'byebug'

maze = Maze.new(ARGV[0])

maze.find_solution

