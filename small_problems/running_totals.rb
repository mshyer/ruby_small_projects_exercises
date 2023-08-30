# Write a method that takes an Array of numbers, and
# returns an Array with the same number
# of elements, and each element has the running total from the original Array.

def running_total(array)
  arr = []
  array.inject(0) do |total, value|
  arr << total + value
  total + value
  end
  arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
 p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
 p running_total([3]) == [3]
 p running_total([]) == []
