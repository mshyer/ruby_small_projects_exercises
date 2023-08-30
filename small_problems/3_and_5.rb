# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some 
# other number, and then computes the sum of those multiples. For instance, if the supplied 
# number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

def multisum(number)
  to_sum = (1..number).to_a.select do |item|
    item % 3 == 0 || item % 5 == 0
  end
  to_sum.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168