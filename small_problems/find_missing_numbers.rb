=begin
problem: Given a sorted array, return an array of all the missing integers in order between first and last number
Data: arrays
algorithm:
1. find all integers between first arr[0] and arr[-1]
  a. range to array from arr[0] to arr[-1]
2. init empty output array
3. iterate through the range array. if number not in input array, append to the output array
4. return the output

=end

def missing(arr)
  result = []
  (arr[0]..arr[-1]).to_a.each { |num| result << num unless arr.include?(num) }
  result
end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

def missing2(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

def missing3(array)
  result = []
  i = array[0]
  loop do
    result << i unless array.include?(i)
    break if i == array[-1]
    i += 1
  end
  result
end

p missing3([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing3([1, 2, 3, 4]) == []
p missing3([1, 5]) == [2, 3, 4]
p missing3([6]) == []