# MyHashSet
#
# Ruby provides a class named `Set`. A set is an unordered collection of
# values with no duplicates.  You can read all about it in the documentation:
#
# http://www.ruby-doc.org/stdlib-2.1.2/libdoc/set/rdoc/Set.html
#
# Let's write a class named `MyHashSet` that will implement some of the
# functionality of a set. Our `MyHashSet` class will utilize a Ruby hash to keep
# track of which elements are in the set.  Feel free to use any of the Ruby
# `Hash` methods within your `MyHashSet` methods.
#
# Write a `MyHashSet#initialize` method which sets an empty hash object to
# `@store`. Next, write an `#insert(el)` method that stores `el` as a key
# in `@store`, storing `true` as the value. Write an `#include?(el)`
# method that sees if `el` has previously been `insert`ed by checking the
# `@store`; return `true` or `false`.
#
# Next, write a `#delete(el)` method to remove an item from the set.
# Return `true` if the item had been in the set, else return `false`.  Add
# a method `#to_a` which returns an array of the items in the set.
#
# Next, write a method `set1#union(set2)` which returns a new set which
# includes all the elements in `set1` or `set2` (or both). Write a
# `set1#intersect(set2)` method that returns a new set which includes only
# those elements that are in both `set1` and `set2`.
#
# Write a `set1#minus(set2)` method which returns a new set which includes
# all the items of `set1` that aren't in `set2`.

class MyHashSet
  attr_accessor :store
  
  def initialize
    @store = {}
  end
  
  def insert(el)
    store[el]= true
  end
  
  def include?(el)
    @store.has_key?(el)
  end
  
  def delete(el)
    if self.store.include?(el)
      @store.delete(el)
      return true
    else
      return false
    end
  end
    
  def to_a
    @store.keys
  end
  
  def union(other_set)
    union_hash = MyHashSet.new
    self.to_a.each {|el1| union_hash.insert(el1)}
    other_set.to_a.each {|el2| union_hash.insert(el2)}
    union_hash
  end
  
  def intersect(other_set)
    inter_hash = MyHashSet.new
    self.to_a.each do |el1|
      if other_set.to_a.include?(el1)
        inter_hash.insert(el1)
      end
    end
    inter_hash
  end
  
  def minus(other_set)
    minus_hash = MyHashSet.new
     self.to_a.each do |el1|
      unless other_set.to_a.include?(el1)
        minus_hash.insert(el1)
      end
    end
    minus_hash
  end
  
  def symmetric_difference(other_set)
    sym_diff_hash = MyHashSet.new
    self.to_a.each do |el1|
      sym_diff_hash.insert(el1) unless other_set.to_a.include?(el1)
    end
    other_set.to_a.each do |el2|
      sym_diff_hash.insert(el2) unless self.to_a.include?(el2)
    end
    sym_diff_hash
  end
  
  def ==(object)
    return false unless object.is_a?(MyHashSet)
    self.to_a.each do |el1|
      return false unless object.to_a.include?(el1)
    end
    object.to_a.each do |el2|
      return false unless self.to_a.include?(el2)
    end
  end
  
end

# Bonus
#
# - Write a `set1#symmetric_difference(set2)` method; it should return the
#   elements contained in either `set1` or `set2`, but not both!
# - Write a `set1#==(object)` method. It should return true if `object` is
#   a `MyHashSet`, has the same size as `set1`, and every member of
#   `object` is a member of `set1`.


