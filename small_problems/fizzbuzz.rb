# Write a method that takes two arguments: the first is the starting number, 
# and the second is the ending number. Print out all numbers between the two 
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
#  divisible by 5, print "Buzz", and finally if a number is 
#  divisible by 3 and 5, print "FizzBuzz".

def fizz_or_buzz(num)
  if num % 3 == 0 && num % 5 == 0
    "fizzbuzz"
  elsif num % 3 == 0
    "fizz"
  elsif num % 5 == 0
    "buzz"
  else
    num.to_s
  end
end

def fizzbuzz(int1, int2)
  arr = []
  1.upto(int2) do |i|
    arr << fizz_or_buzz(i)
  end
  arr.join(", ")
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz