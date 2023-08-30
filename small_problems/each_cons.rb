# def each_cons(array)
#   return nil if array.length < 2
#   i = 0
#   loop do
#     break if i == array.length - 1
#     yield(array[i], array[i + 1])
#     i += 1
#   end
#   nil
# end

# def each_cons(array)
#   array.each_with_index do |ele, idx|
#     break if idx + 1 >= array.length
#     yield(ele, array[idx + 1])
#   end
#   nil
# end

##PART TWO
# Find all ordered sub arrays of n length
  # make a counter at 0
  # start loop
  # break loop if there aren't n-1 left after current index
  # yield of current index plus next n-1
def each_cons(array, n)
  i = 0
  values = 
  loop do
    break if array[i..-1].length <= n - 1
    yield(array[i], *array[(i + 1)..(i + n - 1)])
    i += 1
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}