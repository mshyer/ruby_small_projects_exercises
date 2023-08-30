#recursively split arrays in half over and over again, returning item n if array length 1
#otherwise return 
require 'pry'
def merge_sort(arr)
  new_arr = []
  center = arr.length/2
  if arr.length == 1
    return arr
  end
  sub_1 = arr[0..center-1]
  sub_2 = arr[center..]
  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)
  #binding.pry
  merge(sub_array_1.flatten, sub_array_2.flatten)
end

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

p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]