def translate(sentence)
  vowels=["a", "e", "i", "o", "u", ]
  final_sentence = []
  words = sentence.split(" ")
  cap_ind = words.capitalized
  words.each do |word|
    if [".", ",", "?", "!"].include?(word[-1]) 
      punctuation = word[-1]
      word[-1] = ""
    else
      punctuation = ""
    end
    word.split("").each_with_index do |letter, index|
      if vowels.include?(letter) && word[index - 1..index] != "qu"
        final_sentence << word[index..-1] + word[0...index] + "ay" + punctuation
        break
      end
    end
  end
  final_sentence = final_sentence.map.with_index do |word, index|
    if cap_ind.include?(index)
      word = word.capitalize
    else
      word
    end
  end
  final_sentence.join(" ")
end

public

def capitalized
  indices = []
  self.each_with_index do |word, index|
    if word == word.capitalize
      indices << index
    end
  end
  indices
end