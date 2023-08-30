def sum_square_difference(n)
  square_sum = ((1..n).inject(:+))**2 
  sum_square = (1..n).inject do |x, y|
    x + y**2
  end
  p square_sum - sum_square
end



sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150