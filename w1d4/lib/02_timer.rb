class Timer
  attr_accessor :seconds
  
  def initialize(seconds = 0)
    @seconds = seconds
  end
  
  def hour
    @seconds/3600
  end
  
  def minute
    @seconds%3600/60
  end
  
  def rem_sec
    @seconds%60
  end
    
  
  def time_string
    padded(hour)+":"+padded(minute)+":"+padded(rem_sec)
  end

  def padded(num)
    if num > 10
      "#{num}"
    else
      "0#{num}"
    end
  end
end

