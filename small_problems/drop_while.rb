# def drop_while(array)
#   i = nil
#   array.each_with_index do |ele, idx|
#     if !yield(ele)
#       i =idx
#       break
#     end
#   end
#   return [] if i == nil
#   array[i..]
# end

def drop_while(array)
  i = 0
  while i < array.length && yield(array[i])
    i += 1
  end
  array[i..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []