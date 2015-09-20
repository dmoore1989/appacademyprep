

class Temperature
  
  def Temperature.from_celsius(temp)
    Celsius.new(temp)
  end
  
  def Temperature.from_fahrenheit(temp)
    Fahrenheit.new(temp)
  end
    
  
  def initialize(temp_option)
    @temp_option = temp_option
  end
  
  def in_fahrenheit
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

class Celsius < Temperature
  def initialize(temp)
    @temp_option = {:c => temp}
  end
  
end

class Fahrenheit < Temperature
  def initialize(temp)
    @temp_option = {:f => temp}
  end
  
    
end