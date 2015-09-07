class XmlDocument
  
  def method_missing(method_name, options = {}, &prc)
    if options.empty? && prc.nil?
      final = ""
      final << "<#{method_name}/>"
      @counter += 1
      final << indentation
      final
    elsif prc.nil?
      final = ""
      final << options.map{|key, value| "<#{method_name} #{key}=\"#{value}\"/>"}.join("")
      @counter += 1
      final << indentation
      final
    else
      final = ""
      if options.empty?
        final << "<#{method_name}>"
        @counter += 1
        final << indentation
      else  
        final << options.map{|key, value| "<#{method_name} #{key}=\"#{value}\">"}.join("")
        @counter += 1
        final << indentation
      end
      final << prc.call
      @counter -= 1
      final << "</#{method_name}>"
      final << indentation
      final
    end
  end
  
  def initialize(indent = false)
    @indent = indent
    @counter = 0
  end
  
  def indentation
    if @indent == true
      "\n#{white_space}"
    else
      ""
    end
  end
  
  def white_space
    " " * @counter
  end
end