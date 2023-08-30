=begin
Function returns all possible values (n1, n2) that when multiplied
 together are the sum of all other elements in a given array
[1,2,3,4,5,6]

input: integer n
output: nested or empty array [[n1, n2]] []
data structure: arrays
algorithm:
1. generate (1..n).to_a
2. get every possible combination of 2 numbers in array
  a. sub arrays formula: 2 length iterations with 2 indeces
  b. 
3. select only sub arrays that when multiplied together are greater than n

4. iterate each sub array
  a. select only those that  multiple of sub array is
         equal to sum of larger array minus them
5. return the selected arrays from 4

1, 2, 3, 4, 5, 6, 7, 8, 9, 10

(1..n).sum-(n*2)
numbers[idx1]

Basically, only iterate if idx1 * idx2 could be greater than n-2 range sum

=end

def removNb(n)
  result = []
  min_sum = (1..(n-2)).sum
  max_sum = (1..n).sum
  (n / 2).times do |i|
   result << [min_sum / ((n/2) + (i+ 1)), n/2 + (i + 2)]
  end
  p result
  result.select! {|arr| arr.inject(:*) == max_sum - arr.sum}
  p result.reverse
end

  # numbers = (1..n).to_a
  # sub_arrs = []
  # least_sum = (1..(n - 2)).sum
  # max_sum = (1..(n)).sum
  # numbers.length.times do |idx1|
  #   if least_sum/(idx1 + 1) < n
  #     numbers[least_sum/(idx1 + 1) + 1..max_sum/(idx1 + 1) - 1].length.times do |idx2|
  #       next if numbers[idx1] == numbers[idx2]
  #       sub_arrs << [numbers[idx1], numbers[least_sum/(idx1 + 1) + idx2]]
  #     end
  #   end
  # end
  #   p sub_arrs
  # sub_arrs.select! do |sub_arr|
  #   sub_arr[0] * sub_arr[1] == (numbers.sum - sub_arr.sum)
  # end
  # sub_arrs
# end

p removNb(26) == [[15, 21], [21, 15]]
removNb(10000)

