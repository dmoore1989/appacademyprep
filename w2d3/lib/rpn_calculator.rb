#!/usr/bin/env ruby

class RPNCalculator

  OPERATIONS = [:+, :-, :*, :/]
  OPERATIONS_STR = %w(+ - * /)
  # require 'byebug'
  attr_accessor :calculator
  
  def initialize
    @calculator = []
  end
  
  def evaluate(string)
    @calculator = tokens(string)
    self.value
  end
  
  def pop
    @calculator.pop
  end
  
  def push(item)
    @calculator << item
  end
  
    
  
  def plus
    @calculator << :+ if check
  end
  
  def minus
    @calculator << :- if check
  end
  
  def times
    @calculator << :* if check
  end
  
  def divide
    @calculator << :/ if check
  end
    
  def value
    # debugger
    index = 0
    value_calc = RPNCalculator.new
    while index < calculator.length
      if @calculator[index].is_a?(Symbol)
        num_1 = value_calc.pop
        num_2 = value_calc.pop
        value_calc.push(value_calc.operation(num_1, num_2, @calculator[index]))
        total = value_calc.calculator[-1]
        index += 1 
        while index < calculator.length
          value_calc.push(calculator[index])
          index += 1
        end
        if value_calc.calculator.any?{|x| OPERATIONS.include?(x)}
          return value_calc.value 
        end
      else
        value_calc.push(@calculator[index])
        index += 1
      end
    end
    total
  end
  
  def operation(num_1, num_2, symbol)
    case symbol
    when :+
      num_2 + num_1
    when :-
      num_2 - num_1
    when :*
      num_2 * num_1
    when :/
      num_2.fdiv(num_1)
    end
  end
  
  def tokens(operation_str)
    token_arr = operation_str.split(" ")
    final_arr = []
    token_arr.each do |item|
      if OPERATIONS_STR.include?(item)
        final_arr << item.to_sym
      else
        final_arr << item.to_i
      end
    end
    final_arr
  end      
  
  def check
    if @calculator.empty?
      raise "calculator is empty"
    else
      true
    end
  end
    
end

if __FILE__ == $PROGRAM_NAME
  if !ARGV == []
    ARGV.each do |filename|
      File.foreach(filename) do |line|
        calcline = RPNCalculator.new
        puts calcline.evaluate(line)
      end
    end
  else
    calcline = RPNCalculator.new
    value = []
    value << gets.chomp
    until value[-1] == ""
      value << gets.chomp
    end
    puts calcline.evaluate(value.join(" ")) 
  end

end