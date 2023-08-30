require 'pry'
# def sum_of_sums(arr)
#   counter = 0
#   total = 0
#   arr.each do |item|
#     total += arr[0..counter].sum
#     counter += 1
#   end
#   p total
# end
def sum_of_sums(arr)
  arr.each_with_index.inject(0) do |sum, (ele, ind)| 
  binding.pry
  sum + arr[0..ind].sum 
  end
end

p sum_of_sums([3, 5, 2])