def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
# index = 0
#   new_arr = arr1.each_with_object([]) do |item, arr|
#     arr << arr1[index]
#     arr << arr2[index]
#     index  += 1
#   end
#   p new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']