# Sum
#
# Write an Array method, `sum`, that returns the sum of the elements in the
# array. You may assume that all of the elements are integers.

class Array
  def sum
    accum = 0
    self.each do |num|
      accum += num
    end
    accum
  end
end

# Square
#
# Write an array method, `square`, that returns a new array containing the
# squares of each element. You should also implement a "bang!" version of this
# method, which mutates the original array.

class Array
  def square!
    self.map! { |number| number * number}
      
  end

  def square
    self.map { |number| number * number }
  end
end

# Finding Uniques
#
# Monkey-patch the Array class with your own `uniq` method, called
# `my_uniq`. The method should return the unique elements, in the order
# they first appeared:
#
# ```ruby
# [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
# ```
#
# Do not use the built-in `uniq` method!

class Array
  def my_uniq
    uniq_arr = []
    self.each do |item|
      unless uniq_arr.include?(item)
        uniq_arr << item
      end
    end
    uniq_arr
  end
end

# Two Sum
#
# Write a new `Array#two_sum` method that finds all pairs of positions
# where the elements at those positions sum to zero.
#
# NB: ordering matters. I want each of the pairs to be sorted smaller
# index before bigger index. I want the array of pairs to be sorted
# "dictionary-wise":
#
# ```ruby
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# ```
#
# * `[0, 2]` before `[1, 2]` (smaller first elements come first)
# * `[0, 1]` before `[0, 2]` (then smaller second elements come first)

class Array
  def two_sum
    sum_arr = []
    self.each_with_index do |item, index1|
      index2 = index1 + 1
      while index2 < self.length
        if item + self[index2] == 0
          sum_arr << [index1, index2]
        end
        index2 += 1
      end
    end
    sum_arr
  end
end

# Median
#
# Write a method that finds the median of a given array of integers. If
# the array has an odd number of integers, return the middle item from the
# sorted array. If the array has an even number of integers, return the
# average of the middle two items from the sorted array.

class Array
  def median
    test_arr = self.sort
    if test_arr == []
      nil
    elsif test_arr.length % 2 == 0
      ((test_arr[length/2].to_f + test_arr[(length/2) - 1].to_f) / 2.0)
    else
      test_arr[test_arr.length/2]
    end
  end
end

# My Transpose
#
# To represent a *matrix*, or two-dimensional grid of numbers, we can
# write an array containing arrays which represent rows:
#
# ```ruby
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# ```
#
# We could equivalently have stored the matrix as an array of
# columns:
#
# ```ruby
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# ```
#
# Write a method, `my_transpose`, which will convert between the
# row-oriented and column-oriented representations. You may assume square
# matrices for simplicity's sake. Usage will look like the following:
#
# ```ruby
# matrix = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8]
# ]
#
# matrix.my_transpose
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]
# ```
#
# Don't use the built-in `transpose` method!

class Array
  def my_transpose
    col_array = []
    each_with_index do |arr, row|
      arr.each_with_index do |item, collum|
        col_array[collum] = [] if col_array[collum].nil?
        col_array[collum][row] = item
      end
    end
    col_array
  end
end

# class Array
#   def my_transpose
#     dimension = self.first.count
#     cols = Array.new(dimension) { Array.new(dimension) }

#     dimension.times do |i|
#       dimension.times do |j|
#         cols[j][i] = self[i][j]
#       end
#     end

#     cols
#   end
# end

# Bonus: Refactor your `Array#my_transpose` method to work with any rectangular
# matrix (not necessarily a square one).