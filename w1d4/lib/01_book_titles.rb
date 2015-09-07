class Book
  attr_reader :title
  
  LOWER_WORDS = %w(and or over the of in a an)

  def title=(title)
    final = []
    title_arr = title.split(" ")
    title_arr.each_with_index do |word, index|
      if LOWER_WORDS.include?(word) && index != 0
        final << word
      else
        final << word.capitalize
      end
    end
    @title = final.join(" ")
  end
  
end


