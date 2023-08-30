def map(collection)
  output = []
  collection.each do |ele1, ele2|
    output << yield(ele1, ele2)
  end
  output
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36] # Arrays work: `el2` is simply assigned to `nil`
p map([1, 3, 6]) { |val1, val2| val2 } == [nil, nil, nil] # `el2` is assigned to `nil`
p map({ a: 1, b: 2, c: 3}) { |key, value| "#{key}: #{value * 2}" } == ["a: 2", "b: 4", "c: 6"] # Hashes work