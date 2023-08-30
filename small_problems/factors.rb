def factors(number)
  divisor = number
  factors = ["woops"]
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end

puts factors(5)
puts factors(10)
puts factors(15)
puts factors(0)
puts factors(-10)