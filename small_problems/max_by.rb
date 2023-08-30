#write a map method msanually for input
# map to yield value.
# Find index of the max mapped value
# return the value of the original container at the index found

# def max_by(input)
#   return nil if input.empty?
#   mapped = []
#   input.each do |ele|
#     mapped << yield(ele)
#   end
#   input[mapped.index(mapped.max)]
# end

# keep track of current max
# keep track of current max index
# if current item is bigger than current max, it's the new current max and max index
# return the original at max index

def max_by(input)
  return nil if input.empty?
  current_max = yield(input[0])
  current_max_index = 0
  input[1..-1].each_with_index do |ele, idx|
    yield_value = yield(ele)
    if yield_value > current_max
      current_max = yield_value
      current_max_index = idx + 1
    end
  end
  input[current_max_index]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil