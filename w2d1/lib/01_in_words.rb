class Fixnum
      HIGHER_VALUE = {
      100 => "hundred",
      1000 => "thousand",
      1000000 => "million",
      1000000000 => "billion",
      1000000000000 => "trillion",
      }
  
  def in_words
   
    
    num_words = {
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety"
    }
    num = []
    
    #base of solution
    if self == 0
      num << "zero"
    end
    
    if  self < 20
      num << "#{num_words[self]}"
    elsif self >= 20 && self < 100
      num << "#{num_words[self - self%10]}" 
      num << "#{num_words[self%10]}" 
    end
    
    # if self >= 100 && self < 1000
    #   hundreds = self/100
    #   hundreds_rem = self%100
    #   num << hundreds.in_words + " hundred"
    #   num << hundreds_rem.in_words unless hundreds_rem == 0 
    # end
    
    #Other Value
    
    if self >= 100
      divider = self.base_num
      number = self / divider
      rem = self % divider
      num << "#{number.in_words} #{HIGHER_VALUE[divider]}"
      num << "#{rem.in_words}" unless rem == 0
    end
    

    num.delete("")
    num.join(" ")
  end

  def base_num
    HIGHER_VALUE.keys.sort.each_with_index do |value, i|
      if value > self
        return HIGHER_VALUE.keys.sort[i - 1]
      end
    end
    HIGHER_VALUE.keys[-1]
  end
end