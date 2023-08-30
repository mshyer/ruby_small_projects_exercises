#Find all divisors, return as array
# include Math
# Iterate from one to the square root of number
# If n remainder num is zero, add to output
# return utput
def divisors(n)
  output = []
  sqrt = Math.sqrt(n)
  (1..sqrt).to_a.each do |num| 
    if n % num == 0
      output << num
      output << n / num
    end
  end
  output.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)