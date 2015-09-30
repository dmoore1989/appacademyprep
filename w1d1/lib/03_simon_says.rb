

def echo(sentence)
    sentence
end

def shout(sentence)
    sentence.upcase
end

def repeat(sentence, times = 2)
    final_string = ""
    times.times {final_string << sentence + (" ")}
    final_string[0...-1]
end

def start_of_word(word, num_letters)
    word[0...num_letters]
end

def first_word(sentence)
    sentence.split(" ")[0]
end

def titleize(sentence)
    little_words = %w{and over the a}
    final_array = []
    sentence_array = sentence.split(" ")
    sentence_array.each_with_index do |word, index|
    if index != 0 && little_words.include?(word)
        final_array << word.downcase
    else
        final_array << word.capitalize
    end
    end
    final_array.join(" ")
end
    