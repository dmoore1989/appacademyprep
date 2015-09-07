class Dictionary
  attr_reader :entries
  
  def initialize
    @entries = {}
  end
  
  def add(item)
    if item.is_a?(String)
      @entries[item] = nil
    elsif item.is_a?(Hash)
      @entries.merge!(item)
    end
  end
  
  def keywords
    @entries.keys.sort 
  end
  
  def include?(keyword)
    @entries.keys.each do |word|
      if keyword == word
        return true
      end
    end
    false
  end
  
  def find(lookup)
    keywords = {}
    @entries.keys.each do |key|
      if key.include?(lookup)
        keywords[key] = @entries[key]
      end
    end
    keywords
  end
  
  def printable
    final_string = []
    @entries.sort.each do |key, value|
      final_string << "[#{key}] \"#{value}\""
    end
    final_string.join("\n") 
  end
end