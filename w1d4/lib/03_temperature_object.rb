require 'byebug'

class Temperature
 
  
  def Temperature.from_celsius(temp)
    Temperature.new(c:temp)
  end
  
  def Temperature.from_fahrenheit(temp)
    Temperature.new(f:temp)
  end
    
  
  def initialize(temp_option)
    @temp_option = temp_option
  end
  
  def in_fahrenheit
    debugger
    if @temp_option.keys.include?(:f)
      @temp_option[:f]
    else
      ((@temp_option[:c] * 9.0) / 5.0) + 32
    end
  end
  
  def in_celsius
    if @temp_option.keys.include?(:c)
      @temp_option[:c]
    else
      ((@temp_option[:f] - 32) * 5.0) / 9.0
    end
  end
end
