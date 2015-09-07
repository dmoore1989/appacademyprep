#!/usr/bin/env ruby

puts "Please enter a file name"
file_name = gets.chomp
line_arr = File.readlines(file_name)
line_arr.shuffle!
File.open("#{file_name}-shuffled.txt", "w") do |f|
  line_arr.each do |text|
    f.puts text
  end
end
