# Write a method that takes two Array arguments in which each Array contains a list of numbers, 
# and returns a new Array that contains the product of every pair of numbers that can be formed 
# between the elements of the two Arrays. The results should be sorted by increasing value.

def multiply_all_pairs(arr1, arr2)
  arr3 = []
  arr1.each do |number|
    arr2.each do |number2|
      arr3 << number * number2
    end
  end
  arr3.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

