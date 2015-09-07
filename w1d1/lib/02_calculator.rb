def add(number1, number2)
  number1 + number2
end

def subtract(number1, number2)
  number1 - number2
end

def sum(numbers)
  sum = 0
  numbers.each do |number|
    sum = sum + number
  end
  sum
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
  if number == 0
    return 1
  end
  total = 1
  index = 1
  while index <= number
    total = total * index
    index += 1
  end
  total
end
  