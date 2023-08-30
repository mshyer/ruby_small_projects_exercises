# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2

def recursive_fibonacci(n, arr = [0, 1])
  if n > 2
    arr << recursive_fibonacci(n-1, arr)
  end 
  arr[-1] + arr[-2]
end
#p recursive_fibonacci(500)

# def fibonacci(n)
#   i = 0
#   b = 1
#   counter = 1
#   loop do 
#     i = b + i
#     counter += 1
#     return i if counter == n
#     b = i + b
#     counter += 1
#     return b if counter == n
#   end
#   i
# end
def fibonacci(n)
  first, last = [0,1]
  2.upto(n) do 
    first, last = [last, first + last]
  end
  last
end

p fibonacci(5)

def fibonacci_last_digit(n)
  first, last = [0,1]
  2.upto(n) do 
    first, last = [last, (first + last) % 10]
  end
  last
end

p fibonacci_last_digit(123456789)