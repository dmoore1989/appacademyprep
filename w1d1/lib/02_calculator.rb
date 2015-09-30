def add(number1, number2)
  number1 + number2
end

def subtract(number1, number2)
  number1 - number2
end

def sum(numbers)
  return 0 if numbers == []
  numbers.inject(:+)
end

def multiply(*numbers)
  final = 1
  numbers.each do |number|
    final *= number
  end
  final
end

def power(number,raised_to)
  total = 1
  raised_to.times do
    total *= number
  end
  total
end

def factorial(number)
  return 1 if number == 0
  total = 1
  index = 1
  while index <= number
    total = total * index
    index += 1
  end
  total
end
  