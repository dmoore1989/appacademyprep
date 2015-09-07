class Fixnum

  
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
    
    #hundreds
    if self >= 100 && self < 1000
      hundreds = self/100
      hundreds_rem = self%100
      num << hundreds.in_words + " hundred"
      num << hundreds_rem.in_words unless hundreds_rem == 0 
    end
    
    #thousands
    if self >= 1000 && self < 1000000
      thousands = self/1000
      thousands_rem = self%1000
      num << thousands.in_words + " thousand"
      num << thousands_rem.in_words unless thousands_rem == 0 
    end
    
    if self >= 1000000 && self < 1000000000
      millions = self/1000000
      millions_rem = self%1000000
      num << millions.in_words + " million"
      num << millions_rem.in_words unless millions_rem == 0 
    end
    
    if self >= 1000000000 && self < 1000000000000
      billions = self/1000000000
      billions_rem = self%1000000000
      num << billions.in_words + " billion"
      num << billions_rem.in_words unless billions_rem == 0 
    end
    
    if self >= 1000000000000 && self < 1000000000000000
      trillions = self/1000000000000
      trillions_rem = self%1000000000000
      num << trillions.in_words + " trillion"
      num << trillions_rem.in_words unless trillions_rem == 0 
    end
    
    num.delete("")
    num.join(" ")
  end
end