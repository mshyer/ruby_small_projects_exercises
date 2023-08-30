=begin
Given an array of n positive integers and a positive integer s, 
find the minimal length of a contiguous subarray of which the sum ≥ s.
 If there isn't one, return 0 instead.
Find the minimun length of a sub array that sums to greater
Output: int  

Data structure: array of sub arrays
Algorithm:
1. find all sub arrays
  a. init empty sub array
  b input array length times do
  c. each with index 2
  c sub array append arr[indx..idx2]
2. select all sub arrays that are sum greater than n
3. select the sub array with the lowest length
4. return that length

=end

def minSubLength(input_arr, n)
  arr = []
  input_arr.length.times do |idx1|
    input_arr.each_with_index do |num, idx2|
      arr << input_arr[idx1..idx2]
    end
  end
  arr.select! do |sub_array|
    sub_array.sum >= n
  end
  lengths = arr.map {|sub_arr| sub_arr.length}

  if lengths.min == nil 
    return 0
  end
  lengths.min
end




# p minSubLength([2,3,1,2,4,3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

#______

=begin
# You are given an array which contains only integers (positive and negative). 
#Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# You can asume there is never an empty array and there will always be an integer.



input: array of integers
output: array of integers

Data structure: arrays
algorithm: 
1. iterate through the input array with index
1. init output array
2. init counter var = 1
3. init index variable = 1
4. loop 
   if array of iterate index is equal to array of loop index plus index var

    a. add 1 to counter var and index var
    c. check next index if also equal, add to counter
    if they are not equal, add the value times the counter to the output array
      break
    
=end

def sum_consecutives(input_arr)
  output_arr = []
  input_arr.each_with_index do |value, idx1|
  counter = 1
  idx2 = 1
  loop do
    if value == input_arr[idx2]
      output_arr << input_arr[value] + input_arr[idx1 + idx2]
      idx2 += 1
    else 
      output_arr << value
      break
    end
  end
  p output_arr
end
end

p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]