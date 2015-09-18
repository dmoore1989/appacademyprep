class XmlDocument
  
  def method_missing(method_name, options = {}, &prc)
    final = ''
    if options.empty? && prc.nil?
      final << "<#{method_name}/>"
    elsif prc.nil?
      final << print_option(method_name, options)
      final << next_line
    else
      if options.empty?
        final << "<#{method_name}>"
      end
      @counter += 1
      final << next_line
      final << indentation
      final << prc.call
      @counter -= 1 
      final << indentation
      final << "</#{method_name}>"
      final << next_line
    end
    final
  end
  
  def initialize(indent = false)
    @indent = indent
    @counter = 0
  end
  
  def next_line
    return "\n" if @indent == true
    ""
  end
  
  def indentation
    if @indent == true
      "#{white_space}"
    else
      ""
    end
  end
  
  def white_space
    " " * @counter
  end
  
  def print_option(method_name, option)
    output = option.map do |key, value|
      "<#{method_name} #{key}=\"#{value}\"/>"
    end
    output.join('')
  end
end