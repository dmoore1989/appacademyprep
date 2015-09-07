def measure(repetitions = 1, &prc)
  time_array = []
  repetitions.times do
    start = Time.now
    prc.call
    finish = Time.now
    time_array << finish - start
  end
  time_array.inject(:+) / time_array.length 
end