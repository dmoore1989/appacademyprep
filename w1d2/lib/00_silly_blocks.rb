def reverser(&prc)
  reverse_array = prc.call.split(" ")
  final_array = reverse_array.each { |word| word.reverse! }
  final_array.join(" ")
end

def adder(number = 1, &prc)
  final = prc.call + number
end

def repeater(repeat_count = 1, &prc)
  repeat_count.times do
    prc.call
  end
end