# using two indexes, compare arr1[index1] to arr2[index2] using spaceship operator. 
# Whichever one is smaller, append to new array. Then iterate that index by 1
# if one index is greater than array.length, append other array (index...) to the new array
require 'pry'
def merge(arr1, arr2)
  merged_arr = []
  i1 = 0
  i2 = 0
  loop do
    #binding.pry
    case arr1[i1] <=> arr2[i2]
    when -1
      merged_arr << arr1[i1]
      i1 += 1
    when 0
      merged_arr << arr1[i1]
      merged_arr << arr2[i1]
      i1 += 1
      i2 += 1
    when 1
      merged_arr << arr2[i2]
      i2 += 1
    end
    #check for exit loop
    if i1 == arr1.length
      merged_arr.concat(arr2[i2..-1])
      break
    elsif i2 == arr2.length
      merged_arr.concat(arr1[i1..-1])
      break
    end
  end
  p merged_arr
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
