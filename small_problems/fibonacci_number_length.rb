require 'pry'

def find_fibonacci_index_by_length(digits)
  fibonacci_arr = [1]
  counter = 1
  while fibonacci_arr[-1] / 10**(digits-1) < 1
    fibonacci_arr << counter
    counter = fibonacci_arr[-2] + fibonacci_arr[-1]
  end
  fibonacci_arr.length
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847