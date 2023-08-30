## program calculates the nth number in fibonacci sequence
#Sequence...: 0 1 1 2 3 5 8 13

#puts "what number of fibonnaci sequence would you like to calculate?"
#fibonacci_counter = ((gets.chomp.to_i)-2)

# def fibonnaci(fibonacci_counter)
#   x = 0
#   y = 1
#   for i in 1..fibonacci_counter do
#     z = x + y
#     #puts z
#     x = y
#     #puts x
#     y = z
#     #puts y
#   end
#   puts z
# end

def fibonacci(number)
  if number < 2
    p number
  else
    fibonacci(number-1) + fibonacci(number-2)
  end
end
puts fibonacci(6)

#fibonnaci(fibonacci_counter)


