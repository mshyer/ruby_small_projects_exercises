# Write a method that takes an Array as an argument, and reverses its elements in place; 
# that is, mutate the Array passed into this method. The return value should be the same Array object.

def reverse(array)
  # new_arr = []
  # array.each{ |item| new_arr.prepend(item) }
  # new_arr
  new_arr = array.inject([]){|new_arr, item| new_arr.prepend(item)}
end

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
# def reverse!(array)
#   reversed = []
#   array.each { |item| reversed.prepend(item) }

#   counter = -1
#   array.map! do
#     counter += 1
#     reversed[counter]
#   end
#   array
# end
# require 'pry'

