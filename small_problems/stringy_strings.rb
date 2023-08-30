# Write a method that takes one argument, a positive integer, and returns a string of 
# alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

def stringy(integer)
  str = ''
  arr = [1, 0]
  integer.times do 
    str << arr[0].to_s
    arr.reverse!
  end
  str
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'