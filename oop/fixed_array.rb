=begin
PEDAC:
Problem: Create a Class FixedArray that is an array of a fixed length
Algorithm: 
1. Inititalize each array with nil * number
2. Define custom [] method
  a. if OUT OF RANGE, raise an IndexError exception
  b. Otherwise, use the array [] method
3. Custom to_a method takes the arr instance variable and returns it
4. Custom to_s method takes the arr instance variable and returns it to_s
=end

class FixedArray
  attr_reader :length, :arr
  def initialize(length = 0)
    @length = length
    @arr =[]
    @arr = [nil] * length
  end

  def to_a
    @arr.clone
  end

  def to_s
    @arr.to_s
  end

  def [](n)
    #raise IndexError unless valid?(n)
    arr.fetch(n)
  end

  def []=(n, value)
    self[n]
    @arr[n] = value
  end

  def valid?(n)
    n.between?(-length, length)
  end
end

#test cases
fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end